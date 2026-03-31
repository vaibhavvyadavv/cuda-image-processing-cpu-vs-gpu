#ifndef GRAYSCALE_H
#define GRAYSCALE_H

void grayscale_gpu(unsigned char *input, unsigned char *output,
                   int width, int height, int channels);

void grayscale_cpu(unsigned char *input, unsigned char *output,
                   int width, int height, int channels);

#endif