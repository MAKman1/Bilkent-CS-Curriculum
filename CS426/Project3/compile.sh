gcc util.c convolution_seq.c -o convolution_seq
mpicc util.c convolution_omp.c.c -o convolution_omp