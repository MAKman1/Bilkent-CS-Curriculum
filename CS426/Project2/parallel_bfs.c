#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int m;
int n;
int root;
int partition;
int *rows;
int *columns;

int *frontier;
int FSize;
int *nextFrontier;
int NFSize;

int level;
int *distance;
int *pNumber;
int *pCount;

int main(int argc, char *argv[])
{
	char str[1000];
	FILE *input;
	FILE *output;

	//1 in input, 2 is source, 3 is partition, 4 is output
	if (argc < 5)
		return 1;

	int size, rank = 0;
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	if (rank == 0)
	{
		root = atoi(argv[2]);
		partition = atoi(argv[3]);

		input = fopen(argv[1], "r");
		if (input == NULL)
		{
			printf("Error opening the file\n");
			return 1;
		}

		//Populating Arrays
		m = atoi(fgets(str, 1000, input));
		n = atoi(fgets(str, 1000, input));
		rows = (int *)malloc(sizeof(int) * (m + 1));
		columns = (int *)malloc(sizeof(int) * n);
		level = 1;

		int countA = 0;
		int countB = 0;
		while (fgets(str, 1000, input) != NULL)
		{
			if (countA < m)
			{
				int num = atoi(str);
				rows[countA] = num;
				countA++;
			}
			else
			{
				int num = atoi(str);
				columns[countB] = num;
				countB++;
			}
		}
		rows[m] = n;

		//initializing distance
		distance = (int *)malloc(sizeof(int) * m);
		for (int i = 0; i < m; i++)
		{
			distance[i] = 99999999;
		}
		distance[root] = 0;

		//assigning partitions
		pNumber = (int *)malloc(sizeof(int) * m);
		pCount = (int *)malloc(sizeof(int) * size);
		for (int x = 0; x < size; x++)
		{
			pCount[x] = 0;
		}
		int rem = m % size;
		int max = ceil(m / size);
		int currentCount = 0;
		int current = 0;
		for (int i = 0; i < m; i++)
		{
			pNumber[i] = current;
			pCount[current]++;
			if (currentCount < max)
			{
				currentCount++;
			}
			else
			{
				if (current < rem)
				{
					currentCount = 0;
					current++;
				}
				else
				{
					max--;
					currentCount = 0;
					current++;
				}
			}
		}

		//showing partitions
		if (partition == 1)
		{
			for (int i = 0; i < size; i++)
			{
				printf("P%d: local_number_of_vertices=%d\n", i, pCount[i]);
				//finding start index
				int c = 0;

				while (pNumber[c] != i)
					c++;

				int A = rows[c];
				for (int y = 0; y < pCount[i]; y++)
				{
					int normalized = rows[c + y] - A;
					printf("P%d: vertices[%d]=%d, normalized_vertices[%d]=[%d]\n", i, y, rows[c + y], y, normalized);
				}

				int begin = rows[c];
				int end = rows[c + pCount[i]];
				printf("P%d: local_number_of_edges=%d\n", i, end - begin);
				int u = 0;
				for (int t = begin; t < end; t++)
				{
					printf("P%d: edges[%d]=%d\n", i, u, columns[t]);
					u++;
				}
			}
		}

		FSize = 0;
		NFSize = 0;
		frontier = (int *)malloc(sizeof(int) * 1);
		frontier[FSize] = root;
		FSize++;

		fclose(input);
	}

	MPI_Barrier(MPI_COMM_WORLD);
	//put source to frontier

	while (FSize > 0)
	{

		for (int j = 0; j < FSize; j++)
		{
			int A = rows[frontier[j]];
			int B = rows[frontier[j] + 1];
			for (int a = A; a < B; a++)
			{
				if (distance[columns[a]] == 99999999 && rank == 0)
				{
					distance[columns[a]] = level;
					int *temp = (int *)malloc(sizeof(int) * (NFSize + 1));
					for (int o = 0; o < NFSize; o++)
					{
						temp[o] = nextFrontier[o];
					}
					temp[NFSize] = columns[a];
					nextFrontier = temp;
					NFSize++;
				}
			}
		}

		if (rank == 0)
		{
			frontier = (int *)malloc(sizeof(int) * (NFSize));
			for (int x = 0; x < NFSize; x++)
			{
				frontier[x] = nextFrontier[x];
				nextFrontier[x] = 0;
			}
			FSize = NFSize;
			NFSize = 0;
			level++;
		}
	}

	MPI_Barrier(MPI_COMM_WORLD);

	int tSize = size * 2;
	int *sendBuf = (int *)malloc(sizeof(int) * tSize);
	int *rBuf = (int *)malloc(sizeof(int) * tSize);
	for (int e = 0; e < tSize; e++)
	{
		sendBuf[e] = e;
		rBuf[e] = 0;
	}
	MPI_Alltoall(sendBuf, 2, MPI_INT, rBuf, 2, MPI_INT, MPI_COMM_WORLD);

	if (rank == 0)
	{
		output = fopen(argv[4], "w");
		if (output == NULL)
		{
			printf("Couldn't open output file");
			return 1;
		}
		for (int i = 0; i < m; i++)
		{
			fprintf(output, "%d", distance[i]);
			if (i < m - 1)
				fprintf(output, "\n");
		}

		fclose(output);
	}

	MPI_Finalize();
	return 0;
}