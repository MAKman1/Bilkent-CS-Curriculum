#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	char str[1000];
	int max = -2147483647;
	int min = 2147483647;
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

		int current = 1;
		int subArrays[100][10000] = {};
		int indexes[100] = {};
		for (int i = 0; i < 100; i++)
		{
			indexes[i] = -1;
			for (int j = 0; j < 10000; j++)
			{
				subArrays[i][j] = -1;
			}
		}

		while (fgets(str, 1000, fp) != NULL)
		{
			int num = atoi(str);

			if (indexes[current] < 0)
				indexes[current] = 0;

			subArrays[current][indexes[current]] = num;

			//incrementing indices
			inputCount++;
			indexes[current] += 1;
			if (++current >= size)
				current = 1;
		}

		for (int i = 1; i < size; i++)
		{
			MPI_Send(&indexes[i], 1, MPI_INT, i, 0, MPI_COMM_WORLD);

			if (indexes[i] >= 0)
				MPI_Send(&subArrays[i], 10000, MPI_INT, i, 1, MPI_COMM_WORLD);
		}

		for (int i = 1; i < size; i++)
		{
			int currentMax, currentMin;

			if (indexes[i] >= 0)
			{
				MPI_Recv(&currentMax, 1, MPI_INT, i, 2, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
				MPI_Recv(&currentMin, 1, MPI_INT, i, 3, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

				if (currentMax > max)
					max = currentMax;
				if (currentMin < min)
					min = currentMin;
			}
		}

		printf("%d\n", (max - min));

		fclose(fp);
	}
	else
	{
		int slaveArray[100] = {-1};
		int size = 0;
		MPI_Recv(&size, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		MPI_Recv(&slaveArray, 10000, MPI_INT, 0, 1, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

		for (int i = 0; i < size; i++)
		{
			if (slaveArray[i] > max)
				max = slaveArray[i];
			if (slaveArray[i] < min)
				min = slaveArray[i];

			MPI_Send(&max, 1, MPI_INT, 0, 2, MPI_COMM_WORLD);
			MPI_Send(&min, 1, MPI_INT, 0, 3, MPI_COMM_WORLD);
		}
	}

	MPI_Finalize();
	return 0;
}