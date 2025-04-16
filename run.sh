
#!/bin/bash

echo "Compiling..."
make

echo "Creating output directory..."
mkdir -p output

echo "Running mean filter signal processing..."
./signal_proc > log.txt

echo "Done. Output saved in output/ and log.txt"
