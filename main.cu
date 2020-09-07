
#include <iostream>
#include <cuda.h>
#include <cuda_runtime_api.h>
#include <assert.h>
#include "cudal.cuh"
#include <pthread.h>

__global__
void callCuda(cudal *c,int *array)
{
    printf("%d",*(array + 1));

    c->cudalPrint(array);
}
//void threaded(){
//    int array[10] = {0};
//    cudal *c = new cudal();
//    callCuda<<<1,5>>>(c,array);
//    cudaDeviceSynchronize();
//}
int main()
{
    int *array;
    auto  SIZE = 80;
    cudaMallocManaged((void**)&array,sizeof(int) * 20);
    for(auto i{0}; i < SIZE;i++)
    {
        array[i] = i + 10;
    }
    printf("%d",array[0]);
    dim3 threads(4,2,1);
    dim3 block(2,1,1);
    cudal *c = new cudal();

    callCuda<<<threads,block>>>(c, array);
    cudaDeviceSynchronize();

    std::cout << "Hello, World!" << std::endl;
    cudaFree(array);
    return 0;
}
