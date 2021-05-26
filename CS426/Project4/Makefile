NVCC=nvcc
CUDAFLAGS= -std=c++14 -I .
all: demo.o

demo.o: demo.cu util.cu
	$(NVCC) $(CUDAFLAGS) -o demo.o demo.cu util.cu

clean:
	rm -rf kmer *.o
