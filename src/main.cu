
#include <iostream>
#include <fstream>
#include <cmath>
#include "signal_utils.h"

#define BLOCK_SIZE 256
#define WINDOW_SIZE 5

__global__ void meanFilter(const float* input, float* output, int length) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < length) {
        float sum = 0;
        int count = 0;
        for (int j = -WINDOW_SIZE / 2; j <= WINDOW_SIZE / 2; ++j) {
            int pos = idx + j;
            if (pos >= 0 && pos < length) {
                sum += input[pos];
                count++;
            }
        }
        output[idx] = sum / count;
    }
}

void processFile(const char* filename, const char* outname) {
    float* h_data;
    int length = 0;
    loadCSV(filename, nullptr, &length);
    h_data = new float[length];
    loadCSV(filename, h_data, &length);

    float* d_input;
    float* d_output;
    cudaMalloc(&d_input, length * sizeof(float));
    cudaMalloc(&d_output, length * sizeof(float));

    cudaMemcpy(d_input, h_data, length * sizeof(float), cudaMemcpyHostToDevice);

    int blocks = (length + BLOCK_SIZE - 1) / BLOCK_SIZE;
    meanFilter<<<blocks, BLOCK_SIZE>>>(d_input, d_output, length);

    cudaMemcpy(h_data, d_output, length * sizeof(float), cudaMemcpyDeviceToHost);

    interpolate(h_data, length);
    saveCSV(outname, h_data, length);

    cudaFree(d_input);
    cudaFree(d_output);
    delete[] h_data;
}

int main() {
    processFile("data/sample_signal.csv", "output/mean_filtered_signal.csv");
    std::cout << "Processing completed.\n";
    return 0;
}
