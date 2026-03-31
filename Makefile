CUDA_PATH ?= /usr/local/cuda

all:
	nvcc src/main.cu src/grayscale.cu -o grayscale \
	-I/usr/include/opencv4 \
	-lopencv_core -lopencv_imgcodecs -lopencv_highgui

clean:
	rm -f grayscale