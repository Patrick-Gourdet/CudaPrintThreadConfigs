//
// Created by cplusplus on 8/10/20.
//
#ifdef __CUDACC__
#define CUDA __device__
#define CUDAH __host__
#else
#define CUDA_CALLABLE_MEMBER
#endif
#ifndef CUDALESSON_CUDAL_CUH
#define CUDALESSON_CUDAL_CUH


class cudal {
public:
    CUDAH CUDA cudal() {}
    CUDA ~cudal() {}
    CUDA void cudalPrint(int *array);

};

#endif //CUDALESSON_CUDAL_CUH
