#include <cstdio>
#include <cstdlib>
#include <vector>
#include <algorithm>
#include <cuda_runtime.h>
#include <cublas_v2.h>

/*
* Test for RTX 40 series cards that use the Ada Lovelace architecture
* has 128 CUDA cores per Streaming Multiprocesssor. 
* 4090 : 128 SM
* 4080 S : 80 SM
* 4080 : 76 SM
* 4070 Ti Super: 66 SM
* 4070 Ti : 60 SM
* 4070 S : 56 SM
* 4060 Ti: 34 SM
* 4060 : 24 SM
*/

/*
* Get device info for card type, compute sm's, 
* cuda cores, clock, vram, etc. (ONLY 40 SERIES CARDS)
*/

constexpr int kAdaMajor = 8;
constexpr int kAdaMinor = 9;
constexpr int kAdaCoresPerSM = 128;

struct DeviceInfo {
    int smCount;
    int cudaCore;
    double clockSpeed;
    double maxGflops;
};

DeviceInfo printDeviceInfo(int devInf) {
    cudaDeviceProp prop;
    check(cudaGetDeviceProperties(&prop, devInf), "cudaGetDeviceProperties");

    if 
}