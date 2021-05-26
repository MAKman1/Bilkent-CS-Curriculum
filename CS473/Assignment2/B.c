#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/time.h>

struct Edge
{
	int source;
	int destination;
	double weight;
};

struct Vertice
{
	int value;
	int edgeCount;
	struct Edge **edges;
};

struct Distance
{
	double weight;
	struct Vertice *vertice;
};

struct Vertice *vertices = NULL;
double *distance = NULL;
struct Edge *edges = NULL;
int verticeCount, edgeCount;

int MIN = -2147483648;
int MAX = 2147483647;

struct Distance *heap = NULL;
int heapSize = 0;

void outputSolution();
void shortestPath(int src);

void insertHeap(struct Vertice *v, double distance);
void decreaseKey(int i, int newWeight);
struct Distance extractMax();
void heapify(int i);
void swap(struct Distance *a, struct Distance *b);

int main(int argc, char *argv[])
{
	char str[1000];
	FILE *fp;

	//reading the input file
	if (argc < 2)
		return 1;

	fp = fopen(argv[1], "r");
	if (fp == NULL)
	{
		printf("Error opening the file\n");
		return 1;
	}

	//creating graphs
	int first = 1;
	int source, destination;
	double weight;
	int edge = 0;
	while (fgets(str, 1000, fp) != NULL)
	{
		if (str[0] != '%')
		{
			if (first == 1)
			{

				sscanf(str, "%d %d %d", &verticeCount, &verticeCount, &edgeCount);

				vertices = malloc(sizeof(struct Vertice) * verticeCount);
				distance = malloc(sizeof(int) * verticeCount);
				edges = malloc(sizeof(struct Edge) * edgeCount);

				//initializing edges
				for (int i = 0; i < verticeCount; i++)
				{
					vertices[i].value = i + 1;
					vertices[i].edgeCount = 0;

					vertices[i].edges = NULL;

					distance[i] = 1.0;
				}

				first = 0;
			}
			else
			{
				sscanf(str, "%d %d %lf", &source, &destination, &weight);

				edges[edge].destination = destination;
				edges[edge].source = source;
				edges[edge].weight = weight;

				int index = vertices[source - 1].edgeCount;
				vertices[source - 1].edges = realloc(vertices[source - 1].edges, sizeof(struct Edge *) * (index + 1));
				vertices[source - 1].edges[index] = &edges[edge];
				vertices[source - 1].edgeCount += 1;

				// vertices[source - 1].edges[destination - 1] = &edges[edge];
				// vertices[source - 1].edgeCount += 1;

				edge++;
			}
		}
	}
	fclose(fp);

	shortestPath(0);
}

void shortestPath(int src)
{

	for (int i = 0; i < verticeCount; i++)
	{
		distance[i] = MIN;
	}

	insertHeap(&vertices[src], 0);
	distance[src] = 1.0;

	while (heapSize > 0)
	{
		struct Distance top = extractMax();
		if (top.vertice != NULL)
		{
			for (int i = 0; i < top.vertice->edgeCount; i++)
			{
				int currentV = top.vertice->edges[i]->destination;
				double currentW = top.vertice->edges[i]->weight;

				if (distance[currentV - 1] < (distance[top.vertice->value - 1] * currentW))
				{
					distance[currentV - 1] = (distance[top.vertice->value - 1] * currentW);
					insertHeap(&vertices[currentV - 1], distance[currentV - 1]);
				}
			}
		}
	}

	outputSolution();
}

void outputSolution()
{
	FILE *oFile;
	oFile = fopen("b.txt", "w");
	if (oFile == NULL)
	{
		printf("Error opening output file\n");
		return;
	}
	for (int i = 0; i < verticeCount; i++)
	{
		if (distance[i] == -2147483648.00000000)
		{
			fprintf(oFile, "%d\n", -1);
		}
		else
		{
			fprintf(oFile, "%.8f\n", distance[i]);
		}
	}
	fclose(oFile);
}

void insertHeap(struct Vertice *v, double distance)
{
	if (heapSize == 0)
	{
		heap = malloc(sizeof(struct Distance) * (heapSize + 1));
	}
	else
	{
		heap = realloc(heap, sizeof(struct Distance) * (heapSize + 1));
	}
	heap[heapSize].vertice = v;
	heap[heapSize].weight = distance;
	heapSize++;

	int i = heapSize - 1;
	while (i != 0 && heap[(i - 1) / 2].weight < heap[i].weight)
	{
		//swap
		swap(&heap[i], &heap[(i - 1) / 2]);

		i = (i - 1) / 2;
	}
}
void decreaseKey(int i, int newWeight)
{
	heap[i].weight = newWeight;
	while (i != 0 && heap[(i - 1) / 2].weight > heap[i].weight)
	{
		//swap
		swap(&heap[i], &heap[(i - 1) / 2]);

		i = (i - 1) / 2;
	}
}
struct Distance extractMax()
{
	if (heapSize <= 0)
	{
		struct Distance newItem;
		newItem.vertice = NULL;
		newItem.weight = MIN;
		return newItem;
	}
	if (heapSize == 1)
	{
		heapSize--;
		return heap[0];
	}

	// Store the max value, and remove it from heap
	struct Distance root = heap[0];

	heap[0] = heap[heapSize - 1];

	heapSize--;
	heapify(0);

	return root;
}

void heapify(int i)
{
	int l = (2 * i + 1);
	int r = (2 * i + 2);
	int largest = i;
	if (l < heapSize && heap[l].weight > heap[i].weight)
		largest = l;
	if (r < heapSize && heap[r].weight > heap[largest].weight)
		largest = r;
	if (largest != i)
	{
		swap(&heap[i], &heap[largest]);
		heapify(largest);
	}
}
void swap(struct Distance *a, struct Distance *b)
{
	int tempWeight = a->weight;
	struct Vertice *tempV = a->vertice;
	a->weight = b->weight;
	a->vertice = b->vertice;
	b->weight = tempWeight;
	b->vertice = tempV;
}
