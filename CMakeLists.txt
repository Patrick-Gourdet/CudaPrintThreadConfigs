cmake_minimum_required(VERSION 3.16)
project(cudaLesson CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(cudaLesson main.cu cudal.cu cudal.cuh)

set_target_properties(
        cudaLesson
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)