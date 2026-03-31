#include <iostream>
#include <opencv2/opencv.hpp>
#include <chrono>
#include "grayscale.h"

using namespace std;
using namespace cv;
using namespace std::chrono;

int main(int argc, char** argv) {

    if (argc != 3) {
        cout << "Usage: ./grayscale input.jpg output.jpg\n";
        return -1;
    }

    string input_path = argv[1];
    string output_path = argv[2];

    Mat img = imread(input_path, IMREAD_COLOR);

    if (img.empty()) {
        cout << "Error: Could not load image\n";
        return -1;
    }

    int width = img.cols;
    int height = img.rows;
    int channels = img.channels();

    unsigned char* input_data = img.data;

    unsigned char* output_gpu = new unsigned char[width * height];
    unsigned char* output_cpu = new unsigned char[width * height];

    // ---------------- CPU TIMING ----------------
    auto start_cpu = high_resolution_clock::now();

    grayscale_cpu(input_data, output_cpu, width, height, channels);

    auto end_cpu = high_resolution_clock::now();
    auto cpu_time = duration_cast<milliseconds>(end_cpu - start_cpu);

    // ---------------- GPU TIMING ----------------
    auto start_gpu = high_resolution_clock::now();

    grayscale_gpu(input_data, output_gpu, width, height, channels);

    auto end_gpu = high_resolution_clock::now();
    auto gpu_time = duration_cast<milliseconds>(end_gpu - start_gpu);

    // Save GPU output
    Mat output_img(height, width, CV_8UC1, output_gpu);
    imwrite(output_path, output_img);

    // Print results
    cout << "CPU Time: " << cpu_time.count() << " ms\n";
    cout << "GPU Time: " << gpu_time.count() << " ms\n";

    cout << "Grayscale image saved to " << output_path << endl;

    delete[] output_gpu;
    delete[] output_cpu;

    return 0;
}