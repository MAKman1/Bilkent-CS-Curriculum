#include <stdlib.h>
#include <string.h>
#include <stdio.h>


/*
*	Allocates an rxc integer matrix
*/
int** alloc_2d_matrix(int r, int c);

/*
*	Deallocates an rxc integer matrix
*/
void dealloc_2d_matrix(int ** a, int r, int c);

/*
* Prints an rxc integer matrix
*/
void print_2d_matrix(int **a, int r, int c);

/*@params:
*		file_name: name of the file
*		h: number of rows in the file
*		w: number of columns in the file
*		reads a matrix file
*		note that this function can not read pgm files, only use with given dataset
*       Usage Example:
*       int num_rows,num_columns
*       int **img;
*       char* file_name = argv[1];
*       img = read_pgm_file(argv[1],&num_rows,&num_columns);
**/
int** read_pgm_file(char * file_name, int *num_rows, int *num_columns);
