#include <cuda_runtime.h>
#include "grayscale.h"

__global__ void grayscale_kernel(unsigned char* input,
                                 unsigned char* output,
                                 int width, int height, int channels) {
    
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        int idx = (y * width + x) * channels;

        unsigned char r = input[idx];
        unsigned char g = input[idx + 1];
        unsigned char b = input[idx + 2];

        unsigned char gray = (unsigned char)(0.299f * r + 0.587f * g + 0.114f * b);

        output[y * width + x] = gray;
    }
}

void grayscale_gpu(unsigned char* input,
                   unsigned char* output,
                   int width, int height, int channels) {

    unsigned char *d_input, *d_output;

    size_t input_size = width * height * channels * sizeof(unsigned char);
    size_t output_size = width * height * sizeof(unsigned char);

    cudaMalloc(&d_input, input_size);
    cudaMalloc(&d_output, output_size);

    cudaMemcpy(d_input, input, input_size, cudaMemcpyHostToDevice);

    dim3 block(16, 16);
    dim3 grid((width + 15) / 16, (height + 15) / 16);

    grayscale_kernel<<<grid, block>>>(d_input, d_output, width, height, channels);

    cudaDeviceSynchronize();  // IMPORTANT

    cudaMemcpy(output, d_output, output_size, cudaMemcpyDeviceToHost);

    cudaFree(d_input);
    cudaFree(d_output);
}


// ---------------- CPU VERSION ----------------

void grayscale_cpu(unsigned char* input,
                   unsigned char* output,
                   int width, int height, int channels) {

    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {

            int idx = (y * width + x) * channels;

            unsigned char r = input[idx];
            unsigned char g = input[idx + 1];
            unsigned char b = input[idx + 2];

            unsigned char gray = (unsigned char)(0.299f * r + 0.587f * g + 0.114f * b);

            output[y * width + x] = gray;
        }
    }
}