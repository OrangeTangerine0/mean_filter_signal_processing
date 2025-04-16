# mean_filter_signal_processing

# CUDA Mean Filter Signal Processing

## Overview
This project applies a **moving average** filter (mean filter) to noisy time-series data and reconstructs the signal using linear interpolation. It utilizes **CUDA** to accelerate processing when working with large datasets. The project aims to smooth the signal by replacing each point with the average of its neighboring points within a sliding window.

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
