#include <stdio.h>

#include "util.h"

void normalize_output(int **img,int normalize_amount, int num_rows, int num_cols, int **output_img);

void extend_edges(int **img, int row_index, int col_index, int extend_amount);

int kernel_sum(int **kernel, int kernel_size);

int pixel_operation(int **kernel, int kernel_size, int **img, int row_index, int col_index);

void convolve_image(int **kernel, int kernel_size, int **img, int num_rows, int num_cols, int **output_img);


int main(int argc, char* argv[]) {
    printf("****Util Demo*****\n");
    int num_rows,num_columns;
    int **matrix = read_pgm_file(argv[1],&num_rows,&num_columns);
    
    print_2d_matrix(matrix,num_rows,num_columns);

    // DO YOUR COMPUTATIONS HERE 
    
    dealloc_2d_matrix(matrix,num_rows,num_columns);
     
    return 0;
}
