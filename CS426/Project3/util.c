#include "util.h"

int **alloc_2d_matrix(int r, int c)
{
    int ** a;
    int i;
    a = (int **)malloc(sizeof(int *) * r);
    if (a == NULL) {
        perror("memory allocation failure");
        exit(0);
    }
    for (i = 0; i < r; ++i) {
        a[i] = (int *)malloc(sizeof(int) * c);
        if (a[i] == NULL) {
            perror("memory allocation failure");
            exit(EXIT_FAILURE);
        }
    }
    return a;
}

void dealloc_2d_matrix(int **a, int r, int c)
{
    int i;
   	for (i = 0; i < r; ++i)
        	free(a[i]);
    	free(a);
}

void print_2d_matrix(int **a, int r, int c){
  for(int i = 0; i < r; i++) {
    for(int j = 0; j < c;j++ ){
      printf("%d-",a[i][j] );
    }
    printf("\n\n");
  }
}

int** read_pgm_file(char * file_name, int *num_rows, int *num_columns)
{
    FILE *inputFile = fopen(file_name, "r");
    if(inputFile){
        int success;
        success = fscanf(inputFile, "%d", &*num_rows);
        if(!success){
           printf("Bad File format!\n");
           return(NULL);
        }
        success = fscanf(inputFile, "%d", &*num_columns);
        if(!success){
           printf("Bad File format!\n");
           return(NULL);
        }

        int i,j, int_tmp;
        int** data=alloc_2d_matrix(*num_rows,*num_columns);

        for (i = 0; i < (*num_rows); i++)
        {
            for (j = 0; j < (*num_columns); j++) {
	            fscanf(inputFile,"%d", &int_tmp);
	            data[i][j] = int_tmp;
            }
        }
        fclose(inputFile);
        return data;     
    }
    return(NULL);  
}
