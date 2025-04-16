
TARGET = signal_proc
SRC = main.cu
CC = nvcc

all:
	$(CC) $(SRC) -o $(TARGET)

clean:
	rm -f $(TARGET)
