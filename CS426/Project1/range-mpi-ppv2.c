#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	char str[1000];
	int subArrays[100] = {-1};
	FILE *fp;

	int size, rank, inputCount = 0;
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	if (rank == 0)
	{
		if (argc < 2)
			return 1;

		fp = fopen(argv[1], "r");
		if (fp == NULL)
		{
			printf("Error opening the file\n");
			return 1;
		}

		while (fgets(str, 1000, fp) != NULL)
		{
			int num = atoi(str);
			subArrays[inputCount] = num;

			//incrementing indices
			inputCount++;
		}

		MPI_Bcast(&subArrays, 100, MPI_INT, 0, MPI_COMM_WORLD);

		fclose(fp);
	}

	int max = -2147483647;
	int min = 2147483647;
	for (int i = 0; i < 100 && subArrays[i] > 0; i++)
	{
		if (subArrays[i] > max)
		{
			max = subArrays[i];
		}
		if (subArrays[i] < min)
		{
			min = subArrays[i];
		}
	}

	if (rank == 0)
	{

		int range = max - min;
		printf("%d\n", range);
	}

	MPI_Finalize();
	return 0;
}