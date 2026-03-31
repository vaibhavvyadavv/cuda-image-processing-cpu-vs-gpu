# 🚀 CUDA Image Processing: CPU vs GPU

This project demonstrates **GPU-accelerated image processing using CUDA**, with a comparison between CPU and GPU performance. The application converts a color image into grayscale and highlights the trade-offs between sequential and parallel execution.

---

## 📌 Overview

The goal of this project is to explore how **parallel computing on GPUs** can be used to speed up image processing tasks.

The program:
- Takes a color image as input
- Converts it to grayscale
- Runs both CPU and GPU implementations
- Compares execution time

---

## ⚙️ Grayscale Conversion Formula

The grayscale value is computed using:


Gray = 0.299 × R + 0.587 × G + 0.114 × B


---

## 🧠 Key Concepts

- CUDA kernel programming
- Parallel processing (1 thread per pixel)
- GPU memory management (`cudaMalloc`, `cudaMemcpy`, `cudaFree`)
- CPU vs GPU performance benchmarking
- OpenCV for image input/output

---

## 📁 Project Structure


cuda-image-processing-cpu-vs-gpu/
│
├── src/
│ ├── main.cu
│ ├── grayscale.cu
│ └── grayscale.h
│
├── input/
│ └── input.jpg
│
├── output/
│ └── output.jpg
│
├── Makefile
└── run.sh


---

## 🛠️ Requirements

- CUDA Toolkit
- OpenCV
- C++ Compiler (nvcc)

---

## ▶️ How to Run

### 1. Clone the repository


git clone https://github.com/vaibhavvyadavv/cuda-image-processing-cpu-vs-gpu.git

cd cuda-image-processing-cpu-vs-gpu


---

### 2. Add input image

Place any image in:


input/input.jpg


Or download a sample:


wget https://upload.wikimedia.org/wikipedia/commons/3/3f/JPEG_example_flower.jpg
 -O input/input.jpg


---

### 3. Run the project


bash run.sh


---

## 📊 Sample Output


CPU Time: 1 ms
GPU Time: 140 ms
Grayscale image saved to output/output.jpg


---

## ⚠️ Performance Insight

GPU execution may appear slower for small images due to:
- Memory transfer overhead (CPU ↔ GPU)
- Kernel launch latency

However, for larger images or datasets, GPU parallelism provides significant performance improvements over CPU execution.

---

## 📸 Output

- Input image → `input/input.jpg`
- Output grayscale image → `output/output.jpg`

---

## 🚀 Learnings

- Practical understanding of CUDA and GPU computing
- Differences between CPU and GPU execution models
- Memory management between host and device
- Importance of workload size in parallel computing

---

## 🔮 Future Improvements

- Batch image processing
- Real-time video processing using CUDA
- Optimization using shared memory
- Benchmarking with large datasets

---

## 👨‍💻 Author

Vaibhav Yadav  
BTech CSE (CSAM), IIIT Delhi  

---

## 📌 Note

This project was developed as part of a GPU computing specialization capstone project
