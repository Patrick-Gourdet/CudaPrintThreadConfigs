//
// Created by cplusplus on 8/10/20.
//


#include <stdio.h>

//fonts color
#define FBLACK      "\033[30;"
#define FRED        "\033[31;"
#define FGREEN      "\033[32;"
#define FYELLOW     "\033[33;"
#define FBLUE       "\033[34;"
#define FPURPLE     "\033[35;"
#define D_FGREEN    "\033[6;"
#define FWHITE      "\033[7;"
#define FCYAN       "\x1b[36m"

//background color
#define BBLACK      "40m"
#define BRED        "41m"
#define BGREEN      "42m"
#define BYELLOW     "43m"
#define BBLUE       "44m"
#define BPURPLE     "45m"
#define D_BGREEN    "46m"
#define BWHITE      "47m"

//end color
#define NONE        "\033[0m"
#include <cstdio>
#include <driver_types.h>
#include <cuda_runtime_api.h>
#include "cudal.cuh"


__device__
void cudal::cudalPrint(int *array) {
    printf("%d",*(array + 1));

    auto g = blockDim.x * blockIdx.x + threadIdx.x;
    printf("threads in\n threads only:\t x: %d, y: %d, z: %d \n",
            threadIdx.x,threadIdx.y,threadIdx.z);
    if(threadIdx.x > 0 && threadIdx.x < 20)
    printf("ARRAY\n threads only:\t x: %d\n",
           *(array + threadIdx.x));//,array[threadIdx.y],array[threadIdx.z]);
    printf("threads in\n block dimension in x y and z and their multiples:\t block x: %d, block y: %d, block z: %d, x * y dimention: %d, x * y * z block dim %d \n"
            ,blockDim.x , blockDim.y,blockDim.z,blockDim.x * blockIdx.y,blockDim.x * blockIdx.y* blockDim.z );

    printf( "\n\nthreads  in the blocks ?? BLOCK dim BLOCK Idx THREAD idx ?? in xx.x yy.y zz.z\n\n"
           "block Dim x * block Idx x + thread Idx X:\n\t %d\n"
           "block Dim y * block Idx y + thread Idx Y:\n\t %d\n"
           "block Dim z * block Idx z + thread Idx Z:\n\t %d \n",
           blockDim.x * blockIdx.x + threadIdx.x,
           blockDim.y * blockIdx.y + threadIdx.z,
           blockDim.z * blockIdx.z + threadIdx.z);
    printf("\n\nthreads  in the blocks dim idx and thread in xy.x yx.y zy.z\n\n \t|"
           "Dim x Dim y Thread x: %d\n\t|"
           "Dim x Dim z Thread x: %d\n\t|"
           "Dim x Dim y Thread y: %d\n\t|"
           "Dim y Dim z Thread y: %d\n\t|"
           "Dim x Dim y Thread z: %d\n\t|"
           "Dim x Dim y Thread z: %d\n\t|",
           blockDim.x * blockDim.y + threadIdx.x,
           blockDim.x * blockDim.z + threadIdx.x,
           blockDim.x * blockDim.y + threadIdx.y,
           blockDim.y * blockDim.z + threadIdx.y,
           blockDim.x * blockDim.y + threadIdx.z,
           blockDim.y * blockDim.z + threadIdx.z);
    if(blockDim.x * blockDim.y + threadIdx.x > 0 && blockDim.x * blockDim.y + threadIdx.x< 20)
    printf("\n\nARRAY  in the blocks dim idx and thread in xy.x yx.y zy.z\n\n \t|"
           "Dim x Dim y Thread x: %d\n\t|"
           "Dim x Dim z Thread x: %d\n\t|"
           "Dim x Dim y Thread y: %d\n\t|"
           "Dim y Dim z Thread y: %d\n\t|"
           "Dim x Dim y Thread z: %d\n\t|"
           "Dim x Dim y Thread z: %d\n\t|",
    *(array + blockDim.x * blockDim.y + threadIdx.x),
    *(array + blockDim.x * blockDim.z + threadIdx.x),
    *(array + blockDim.x * blockDim.y + threadIdx.y),
    *(array + blockDim.y * blockDim.z + threadIdx.y),
    *(array + blockDim.x * blockDim.y + threadIdx.z),
    *(array + blockDim.y * blockDim.z + threadIdx.z));

}

