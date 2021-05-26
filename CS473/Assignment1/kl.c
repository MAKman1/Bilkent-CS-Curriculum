#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/time.h>

struct Edge
{
	int source;
	int destination;
};

struct Vertice
{
	int partition;
	int value;
	struct Edge **edges;
	int edgeCount;
	int active;
};

struct VerticeToD
{
	int dValue;
	struct Vertice *vertice;
};

struct ListNode
{
	int value;
	struct ListNode *next;
};

struct Vertice *vertices = NULL;
struct Edge *edges = NULL;
int v, e;
int partition;
int *dValues = NULL;

struct VerticeToD *heapVerticesA = NULL;
int heapVerticesACount = 0;
struct VerticeToD *heapVerticesB = NULL;
int heapVerticesBCount = 0;

int *La = NULL;
int *Lb = NULL;
int *Lg = NULL;
int LaSize, LbSize, LgSize;

int MIN = -2147483648;
int gMax = 1000;

void heapify(struct VerticeToD **arr, int n, int i);

void heapSort(int AorB);

void initializeHeap();

void updateHeaps();

int getCutsize();

long toMicrosec(const struct timeval *start, const struct timeval *end);

void klRun();

int isHeap = 1;

int main(int argc, char *argv[])
{
	char str[1000];
	FILE *fp;

	//reading the input file
	if (argc < 3)
		return 1;

	fp = fopen(argv[1], "r");
	if (fp == NULL)
	{
		printf("Error opening the file\n");
		return 1;
	}

	//creating graphs
	int first = 1;
	int edgeCount = 0;
	int source, destination;
	while (fgets(str, 1000, fp) != NULL)
	{
		if (str[0] != '%')
		{
			if (first == 1)
			{

				sscanf(str, "%d %d %d", &v, &v, &e);

				vertices = malloc(sizeof(struct Vertice) * v);
				dValues = malloc(sizeof(int *) * v);
				edges = malloc(sizeof(struct Edge) * e);

				//initializing edges
				for (int i = 0; i < v; i++)
				{
					vertices[i].value = i + 1;
					vertices[i].edgeCount = 0;
					vertices[i].edges = NULL;
					vertices[i].partition = 0;
					vertices[i].active = 1;
				}

				first = 0;
			}
			else
			{
				sscanf(str, "%d %d", &source, &destination);

				edges[edgeCount].destination = destination;
				edges[edgeCount].source = source;

				int index = vertices[source - 1].edgeCount;
				vertices[source - 1].edges = realloc(vertices[source - 1].edges, sizeof(struct Edge *) * (index + 1));
				vertices[source - 1].edges[index] = &edges[edgeCount];
				vertices[source - 1].edgeCount += 1;

				index = vertices[destination - 1].edgeCount;
				vertices[destination - 1].edges = realloc(vertices[destination - 1].edges, sizeof(struct Edge *) * (index + 1));
				vertices[destination - 1].edges[index] = &edges[edgeCount];
				vertices[destination - 1].edgeCount += 1;

				edgeCount++;
			}
		}
	}
	fclose(fp);

	if( strcmp(argv[2], "a") == 0){
		isHeap = 1;
		klRun();
		printf("\n");
	} else {
		isHeap = 0;
		klRun();
		printf("\n");
	}
	
	
}
void klRun()
{
	struct timeval before, after;

	gettimeofday(&before, NULL);

	//Dividing partitions
	for (int i = 0; i < v; i++)
	{
		if (i < floor(v / 2))
		{
			vertices[i].partition = 0;
		}
		else
		{
			vertices[i].partition = 1;
		}
	}

	//Partitioning graph
	partition = floor(v / 2);

	//Output initial cutsize
	printf("%d", getCutsize());

	do
	{
		//Activating vertices
		for (int i = 0; i < v; i++)
		{
			vertices[i].active = 1;
		}
		//Calculating d values
		for (int i = 0; i < v; i++)
		{
			int A = 0;
			int B = 0;
			for (int j = 0; j < vertices[i].edgeCount; j++)
			{
				// printf("%d %d %d \n", vertices[i].edges[j]->source, vertices[i].edges[j]->destination, partition);
				int sVal = vertices[i].edges[j]->source;
				int dVal = vertices[i].edges[j]->destination;
				if (vertices[sVal - 1].partition == vertices[dVal - 1].partition)
					B++;
				else
					A++;
			}
			// if( A > B)
			// printf("%i: %d %d,  ", i, A, B);
			dValues[i] = abs(A) - abs(B);
		}

		if (isHeap == 1)
			initializeHeap();

		// Initializing lists
		if (La != NULL)
			free(La);
		if (Lb != NULL)
			free(Lb);
		if (Lg != NULL)
			free(Lg);

		La = NULL;
		Lb = NULL;
		Lg = NULL;
		LaSize = 0;
		LbSize = 0;
		LgSize = 0;

		int i = 0;

		for (int n = 0; n < partition; n++)
		{
			struct VerticeToD *A = NULL;
			struct VerticeToD *B = NULL;
			if (isHeap == 1)
			{
				//extract a and b with max values
				A = &(heapVerticesA[heapVerticesACount - 1]);
				B = &(heapVerticesB[heapVerticesBCount - 1]);
			}
			else
			{
				A = malloc(sizeof(struct VerticeToD));
				B = malloc(sizeof(struct VerticeToD));
				A->dValue = MIN;
				B->dValue = MIN;
				for (int t = 0; t < v; t++)
				{
					if (vertices[t].active == 1)
					{
						if (vertices[t].partition == 0 && dValues[t] > A->dValue)
						{
							A->dValue = dValues[t];
							A->vertice = &vertices[t];
						}
						else if (vertices[t].partition == 1 && dValues[t] > B->dValue)
						{
							B->dValue = dValues[t];
							B->vertice = &vertices[t];
						}
					}
				}
			}

			// if( B->dValue > 0)
			// printf("%d %d, ", A->dValue, B->dValue);

			int G = A->dValue + B->dValue;

			Lg = realloc(Lg, sizeof(int *) * (LgSize + 1));
			Lg[LgSize] = G;
			LgSize++;

			La = realloc(La, sizeof(int *) * (LaSize + 1));
			La[LaSize] = A->vertice->value;
			LaSize++;

			Lb = realloc(Lb, sizeof(int *) * (LbSize + 1));
			Lb[LbSize] = B->vertice->value;
			LbSize++;

			//Deactivating vertice
			A->vertice->active = 0;
			B->vertice->active = 0;

			// //Increment i
			i += 1;

			//Update D values of affected elements in A − {a} and B − {b}
			//neighbours

			// for (int j = 0; j < vertices[i].edgeCount; j++)
			// {
			// printf("%d %d %d \n", vertices[i].edges[j]->source, vertices[i].edges[j]->destination, partition);
			// }
			// if( A > B)
			// printf("%d %d\n", A, B);

			// for (int x = 0; x < v; x++)
			// {
			// 	if (vertices[x].active == 1)
			// 	{
			// 		int ACount = 0;
			// 		int BCount = 0;
			// 		for (int y = 0; y < vertices[x].edgeCount; y++)
			// 		{
			// 			int sVal = vertices[x].edges[y]->source;
			// 			int dVal = vertices[x].edges[y]->destination;
			// 			if (vertices[sVal - 1].active == 1 && vertices[dVal - 1].active == 1)
			// 			{
			// 				if (vertices[sVal - 1].partition == vertices[dVal - 1].partition)
			// 					BCount++;
			// 				else
			// 					ACount++;
			// 			}
			// 		}
			// 		dValues[x] = abs( ACount) - abs( BCount);
			// 	}
			// }
			for (int j = 0; j < A->vertice->edgeCount; j++)
			{

				if (A->vertice->edges[j]->source != A->vertice->value)
				{
					if (vertices[A->vertice->edges[j]->source - 1].partition == 0)
					{
						dValues[A->vertice->edges[j]->source - 1] += 1;
					}
					else
					{
						dValues[A->vertice->edges[j]->source - 1] -= 1;
					}
				}
				else
				{
					if (vertices[A->vertice->edges[j]->destination - 1].partition == 0)
					{
						dValues[A->vertice->edges[j]->destination - 1] += 1;
					}
					else
					{
						dValues[A->vertice->edges[j]->destination - 1] -= 1;
					}
				}
			}

			for (int j = 0; j < B->vertice->edgeCount; j++)
			{
				if (B->vertice->edges[j]->source != B->vertice->value)
				{
					if (vertices[B->vertice->edges[j]->source - 1].partition == 1)
					{
						dValues[B->vertice->edges[j]->source - 1] += 1;
					}
					else
					{
						dValues[B->vertice->edges[j]->source - 1] -= 1;
					}
				}
				else
				{
					if (vertices[B->vertice->edges[j]->destination - 1].partition == 1)
					{
						dValues[B->vertice->edges[j]->destination - 1] += 1;
					}
					else
					{
						dValues[B->vertice->edges[j]->destination - 1] -= 1;
					}
				}
			}

			//values

			if (isHeap == 1)
			{
				heapVerticesACount--;
				heapVerticesBCount--;
				updateHeaps();
			}
		}

		//Find k which maximizes gmax
		int K = 0;
		int sum = 0;
		int max = MIN;
		for (int i = 0; i < LgSize; i++)
		{
			sum += Lg[i];
			if (sum > max)
			{
				max = sum;
				K = i;
			}
		}
		// printf("\n");
		// printf("max: %d @ %d\n", max, K);

		if (max > 0)
		{
			//Exchange La[1], La[2]..La[k] with Lb[1], Lb[2]..Lb[k]
			for (int i = 0; i <= K; i++)
			{
				int ValA = La[i];
				int ValB = Lb[i];

				vertices[ValA - 1].partition = 1;
				vertices[ValB - 1].partition = 0;
			}
		}

		gMax = max;

	} while (gMax > 0);

	gettimeofday(&after, NULL);

	//Output final cutsize
	printf(" %d", getCutsize());
	printf(" %.1fs ", 1e-6 * toMicrosec(&before, &after));
}

long toMicrosec(const struct timeval *start, const struct timeval *end)
{
	long sec = end->tv_sec - start->tv_sec; //to avoid overflow
	long microseconds = ((sec * 1000000) + end->tv_usec) - start->tv_usec;
	return microseconds;
}

int getCutsize()
{
	int cutSize = 0;
	for (int i = 0; i < e; i++)
	{
		if (vertices[edges[i].destination - 1].partition != vertices[edges[i].source - 1].partition)
			cutSize++;
	}
	return cutSize;
}

void heapify(struct VerticeToD **arr, int n, int i)
{

	int largest = i;   // Initialize largest as root
	int l = 2 * i + 1; // left = 2*i + 1
	int r = 2 * i + 2; // right = 2*i + 2

	// If left child is larger than root
	if (l < n && (*arr)[l].dValue > (*arr)[largest].dValue)
		largest = l;

	// If right child is larger than largest so far
	if (r < n && (*arr)[r].dValue > (*arr)[largest].dValue)
		largest = r;

	// If largest is not root
	if (largest != i)
	{
		struct Vertice *tempVertice = (*arr)[i].vertice;
		int tempVal = (*arr)[i].dValue;
		(*arr)[i].vertice = (*arr)[largest].vertice;
		(*arr)[i].dValue = (*arr)[largest].dValue;
		(*arr)[largest].vertice = tempVertice;
		(*arr)[largest].dValue = tempVal;

		// Recursively heapify the affected sub-tree
		heapify(arr, n, largest);
	}
}

void heapSort(int AorB)
{
	int n = 0;
	struct VerticeToD **arr;
	if (AorB == 0)
	{
		arr = &heapVerticesA;
		n = heapVerticesACount;
	}
	else
	{
		arr = &heapVerticesB;
		n = heapVerticesBCount;
	}

	// Build heap (rearrange array)
	for (int i = n / 2 - 1; i >= 0; i--)
		heapify(arr, n, i);

	// One by one extract an element from heap
	for (int i = n - 1; i > 0; i--)
	{
		// Move current root to end
		struct Vertice *tempVertice = (*arr)[0].vertice;
		int tempVal = (*arr)[0].dValue;
		(*arr)[0].vertice = (*arr)[i].vertice;
		(*arr)[0].dValue = (*arr)[i].dValue;
		(*arr)[i].vertice = tempVertice;
		(*arr)[i].dValue = tempVal;

		// call max heapify on the reduced heap
		heapify(arr, i, 0);
	}
}

void initializeHeap()
{

	if (heapVerticesA != NULL)
		free(heapVerticesA);
	if (heapVerticesB != NULL)
		free(heapVerticesB);

	//Allocate new heap lists
	heapVerticesACount = 0;
	heapVerticesBCount = 0;
	heapVerticesA = malloc(sizeof(struct VerticeToD) * (floor(v / 2)));
	heapVerticesB = malloc(sizeof(struct VerticeToD) * (v - floor(v / 2)));

	for (int i = 0; i < v; i++)
	{
		if (vertices[i].partition == 0)
		{
			heapVerticesA[heapVerticesACount].dValue = dValues[i];
			heapVerticesA[heapVerticesACount].vertice = &vertices[i];
			heapVerticesACount++;
		}
		else
		{
			heapVerticesB[heapVerticesBCount].dValue = dValues[i];
			heapVerticesB[heapVerticesBCount].vertice = &vertices[i];
			heapVerticesBCount++;
		}
	}

	//HeapSort
	heapSort(0);
	heapSort(1);
}

void updateHeaps()
{
	for (int i = 0; i < heapVerticesACount; i++)
	{
		heapVerticesA[i].dValue = dValues[heapVerticesA[i].vertice->value - 1];
	}
	for (int i = 0; i < heapVerticesBCount; i++)
	{
		heapVerticesB[i].dValue = dValues[heapVerticesB[i].vertice->value - 1];
	}

	heapSort(0);
	heapSort(1);
}
