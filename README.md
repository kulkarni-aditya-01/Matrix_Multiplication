# Matrix Multiplication — Performance Overview

## 🛠 Build Configuration

To compile the code with **OpenMP support**, **ThreadSanitizer**, **debug symbols**, and **optimizations**:

**Command:**

```bash
/usr/bin/clang _01_Matrix_Multiplication.c -fopenmp -fsanitize=thread -g -O2 -o _01_Matrix_Multiplication_c
```
Performance & Architectural Observations :
<H3> 1.Naive O(N³) Computation Model </H3>
The current implementation uses a simple triple-nested loop for computing <b>C = A × B, leading to a time complexity of O(N³)</b>. While straightforward, this results in extremely high computational load for large N and produces immense memory traffic across the CPU cache hierarchy.

<H3> 2. Poor Cache Utilization (L1 & L2 Cache Pressure) </H3>H3>
The naive row–column access order exhibits weak spatial and temporal locality, leading to frequent L1 and L2 cache evictions. Due to these cache misses, the processor repeatedly fetches data from higher-latency memory levels, significantly degrading throughput and effective FLOPS.
    
<H3>3.Execution Time Impact at Large Scale </H3>
Due to the combined effects of high computation complexity and poor locality, multiplying matrices of size <b>2000×2000</b> resulted in an execution time of <b>260+ seconds</b> on the test platform, demonstrating how cache behavior and memory access patterns dominate performance in naive matrix multiplication.

<H3>4. Tiling into the Array</H3>
This is mostly worked efficitively on the cache optimization. The tile of the 64*64 size block help to access the whole cache dataline at a time and prevent the thrashing on the very high demand. But it cause a over head on a L2 and L3 cache such as a data is continuosly changing and access pattern where the 2000*2000 array is too big. But it help too much for the optimization. 
Such it help to boost the speed for the 2000*2000 array multiplication by the 5X as comapred to the simple matrix multiplication 

**List of the pragma that will help definitely** : 
```bash
<H4>#pragma omp parallel for : this will make the for loop into the parallel section but only outer loop no the inner loop, so it cause overhead of the nested loops to a each and every thread</H4>
<H4>#pragma omp parallel for schedule(static)</H4>
<H4>#pragma omp tile (64*64*64) // three time beacuse 3 loop are nested there</H4>
<H4>I have not used but you can make a statment on the loop unrolling, loop collapse and cache accesing for the multithreading so it will work on Instruction Level Paralleslism to boost performance</H4>
```
