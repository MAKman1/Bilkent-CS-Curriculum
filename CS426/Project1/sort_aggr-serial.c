#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
	char str[1000];
	int indexes[100] = {-1};
	int values[100] = {-1};
	int totalValues = 0;
	FILE *fp;

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
		int index = 0;
		int value = 0;

		int i = strlen( str);
		int current = 0;
	
		totalValues++;
	}

	fclose(fp);
	return 0;
}