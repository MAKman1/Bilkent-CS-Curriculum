#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	char str[1000];
	FILE *input;
	FILE *output;

	if (argc < 4)
		return 1;

	int root = atoi(argv[2]);
	output = fopen(argv[3], "w");
	input = fopen(argv[1], "r");
	if (input == NULL)
	{
		printf("Error opening the file\n");
		return 1;
	}

	//Populating Arrays
	int m = atoi(fgets(str, 1000, input));
	int n = atoi(fgets(str, 1000, input));
	int rows[m + 1];
	int columns[n];

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

	//initialize frontier and next frontier
	int currentQueue[10000];
	int nextQueue[10000];
	int CQsize = 0;
	int NQsize = 0;

	//put source to frontier
	currentQueue[CQsize] = root;
	CQsize++;

	//all distances to infinity
	int d[m];
	for (int i = 0; i < m; i++)
	{
		d[i] = 99999999;
	}
	d[root] = 0;

	int level = 1;

	while (CQsize > 0)
	{
		for (int j = 0; j < CQsize; j++)
		{
			int A = rows[currentQueue[j]];
			int B = rows[currentQueue[j] + 1];
			for (int a = A; a < B; a++)
			{
				if (d[columns[a]] == 99999999)
				{
					d[columns[a]] = level;
					nextQueue[NQsize] = columns[a];
					NQsize++;
				}
			}
		}
		for (int x = 0; x < 10000; x++)
		{
			currentQueue[x] = nextQueue[x];
			nextQueue[x] = 0;
		}
		CQsize = NQsize;
		NQsize = 0;

		level++;
	}

	//outputting to file
	if (output == NULL)
	{
		printf("Couldn't open output file");
		return 1;
	}
	for (int i = 0; i < m; i++)
	{
		fprintf(output, "%d", d[i]);
		if (i < m - 1)
			fprintf(output, "\n");
	}

	fclose(input);
	fclose(output);
	return 0;
}