#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "util.h"

void normalize_output(int **img, int normalize_amount, int num_rows, int num_cols, int **output_img);

int **extend_edges(int **img, int num_rows, int num_cols, int extend_rows, int extend_columns);

int kernel_sum(int **kernel, int kernel_size);

int pixel_operation(int **kernel, int kernel_rows, int kernel_columns, int **img, int row_index, int col_index, int num_rows, int num_col);

int **convolve_image(int **kernel, int kernel_rows, int kernel_cols, int **img, int num_rows, int num_cols, int **output);

int **fix_img(int **img, int num_rows, int num_cols, int extend_rows, int extend_cols);

int num_rows, num_columns;
int new_rows, new_columns;
int kernel_rows, kernel_columns;
int **matrix;
int **kernel;

int **output_image;
int size, rank = 0;

int main(int argc, char *argv[])
{
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	if (rank == 0)
	{
		matrix = read_pgm_file(argv[1], &num_rows, &num_columns);
		kernel = read_pgm_file(argv[2], &kernel_rows, &kernel_columns);

		int extend_rows = floor(kernel_rows / 2);
		int extend_columns = floor(kernel_columns / 2);
	}

	MPI_Barrier(MPI_COMM_WORLD);
	matrix = convolve_image(kernel, kernel_rows, kernel_columns, matrix, num_rows, num_columns, NULL);
	MPI_Barrier(MPI_COMM_WORLD);

	if (rank == 0)
	{
		int **output = NULL;
		

		FILE *outFile;
		outFile = fopen(argv[3], "w");
		if (outFile == NULL)
		{
			printf("Couldn't open output file");
			return 1;
		}
		fprintf(outFile, "%d\n", num_rows);
		fprintf(outFile, "%d\n", num_columns);
		for (int i = 0; i < num_rows; i++)
		{
			for (int j = 0; j < num_columns; j++)
			{
				fprintf(outFile, "%d ", matrix[i][j]);
			}
			fprintf(outFile, "\n");
		}
		fclose(outFile);

		dealloc_2d_matrix(matrix, num_rows, num_columns);
		dealloc_2d_matrix(kernel, kernel_rows, kernel_columns);
	}

	// new_rows = num_rows + (extend_rows * 2);
	// new_columns = num_columns + (extend_columns * 2);
	// extend_edges( matrix, num_rows, num_columns, extend_rows, extend_columns);
	// print_2d_matrix(matrix, new_rows, new_columns);

	// DO YOUR COMPUTATIONS HERE

	return 0;
}

void normalize_output(int **img, int normalize_amount, int num_rows, int num_cols, int **output_img)
{
	for (int i = 0; i < num_rows; i++)
	{
		for (int j = 0; j < num_cols; j++)
		{
			img[i][j] = (img[i][j] / normalize_amount);
		}
	}
	output_img = img;
}

int **extend_edges(int **img, int num_rows, int num_cols, int extend_rows, int extend_columns)
{

	//extending each column
	int new_cols = num_cols + (extend_columns * 2);
	for (int i = 0; i < num_rows; i++)
	{
		img[i] = (int *)realloc(img[i], (sizeof(int)) * new_cols);
		//Moving elements forward
		for (int j = num_cols - 1; j >= 0; j--)
		{
			img[i][j + extend_columns] = img[i][j];
		}
		//Populating earlier
		for (int j = new_cols - 1; j >= num_cols + extend_columns; j--)
		{
			img[i][j] = img[i][num_cols + extend_columns - 1];
		}
		//Populating later
		for (int j = 0; j < extend_columns; j++)
		{
			img[i][j] = img[i][extend_columns - 1];
		}
	}

	//extending rows
	int new_rows = num_rows + (extend_rows * 2);
	img = (int **)realloc(img, (sizeof(int *)) * new_rows);

	//Moving elements forward
	for (int j = num_rows - 1; j >= 0; j--)
	{
		img[j + extend_rows] = img[j];
	}
	//Populating later
	for (int j = new_rows - 1; j >= num_rows + extend_rows; j--)
	{
		img[j] = img[num_rows + extend_rows - 1];
	}
	//Populating later
	for (int j = 0; j < extend_rows; j++)
	{
		img[j] = img[extend_rows];
	}

	return img;
}

int kernel_sum(int **kernel, int kernel_size)
{
	int sum = 0;
	for (int i = 0; i < kernel_size; i++)
	{
		for (int j = 0; j < kernel_size; j++)
		{
			sum += kernel[i][j];
		}
	}
	if (sum == 0)
		return 1;
	else
		return sum;
}

int pixel_operation(int **kernel, int kernel_rows, int kernel_columns, int **img, int row_index, int col_index, int num_rows, int num_cols)
{
	int sum = 0;
	int half_rows = floor(kernel_rows / 2);
	int half_cols = floor(kernel_columns / 2);

	int kernel_row = 0;
	for (int i = row_index; i < row_index + kernel_rows; i++)
	{
		int kernel_column = 0;
		for (int j = col_index; j < col_index + kernel_columns; j++)
		{

			sum += kernel[kernel_row][kernel_column] * img[i][j];
			kernel_column++;
		}
		kernel_row++;
	}
	//updating all elements or some
	return sum;
}

int **fix_img(int **img, int num_rows, int num_cols, int extend_rows, int extend_cols)
{
	//revert
	for (int i = 0; i < num_rows; i++)
	{
		img[i] = img[i + extend_rows];
	}

	for (int i = 0; i < num_rows; i++)
	{
		for (int j = 0; j < num_cols; j++)
		{
			img[i][j] = img[i][j + extend_cols];
		}
	}
	img = realloc(img, (sizeof(int *) * num_rows));
	for (int i = 0; i < num_cols; i++)
	{
		img[i] = realloc(img[i], sizeof(int) * num_cols);
	}
	return img;
}

int **convolve_image(int **kernel, int kernel_rows, int kernel_cols, int **img, int num_rows, int num_cols, int **output)
{
	int extend_rows = floor(kernel_rows / 2);
	int extend_cols = floor(kernel_cols / 2);
	img = extend_edges(img, num_rows, num_cols, extend_rows, extend_cols);

	output_image = malloc(sizeof(int *) * num_rows);
	for (int i = (rank * (num_rows / size)) ; i < (rank + 1 * (num_rows / size)); i++)
	{
		output_image[i] = malloc(sizeof(int) * num_cols);
		for (int j = 0; j < num_cols; j++)
		{
			output_image[i][j] = 0;
		}
	}

	for (int i = (rank * (num_rows / size)) ; i < (rank + 1 * (num_rows / size)); i++)
	{
		for (int j = 0; j < num_cols; j++)
		{
			int value = pixel_operation(kernel, kernel_rows, kernel_cols, img, i, j, num_rows, num_cols);
			output_image[i][j] = value;
		}
	}

	MPI_Barrier(MPI_COMM_WORLD);

	if( rank == 0){
		int sum = kernel_sum(kernel, kernel_cols);
		normalize_output(output_image, sum, num_rows, num_cols, NULL);
		return output_image;
	}
	return NULL;
	// img = fix_img(img, num_rows, num_cols, extend_rows, extend_cols);
}