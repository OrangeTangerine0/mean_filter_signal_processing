# mean_filter_signal_processing

# CUDA Mean Filter Signal Processing

## Overview
This project applies a **moving average** filter (mean filter) to noisy time-series data and reconstructs the signal using linear interpolation. It utilizes **CUDA** to accelerate processing when working with large datasets. The project aims to smooth the signal by replacing each point with the average of its neighboring points within a sliding window.

In this Mean Filter project, we'll apply a moving average filter (which is a type of mean filter) to noisy time-series data. The goal is to reduce high-frequency noise and smooth out fluctuations by averaging neighboring values.

The mean filter computes the average of a sliding window over the data, and this average becomes the new value at the center of the window.

Project Steps:
Apply Mean Filter (Moving Average): This step involves sliding a window over the signal, and at each window position, calculating the mean of the window's values. The center of the window is replaced by this mean.

Reconstruction: Similar to smoothing, if there are large outliers or missing values in the signal, the filter will help reconstruct them with the mean of nearby values, making the signal continuous.

## Dataset
Source: [DSP Related Sound Examples](https://www.dsprelated.com/freebooks/pasp/Sound_Examples.html)

## Files
- `main.cu`: CUDA kernel and main program.
- `signal_utils.h`: Function declarations and utilities.
- `Makefile`: Compile everything.
- `run.sh`: Shell script to run the compiled binary.
- `data/`: Folder containing `.csv` signal files.
- `output/`: Folder where processed files will be saved.

## How to Run
```bash
chmod +x run.sh
./run.sh
