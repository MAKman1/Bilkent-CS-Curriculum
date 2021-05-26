#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	char str[1000];
	int max = -2147483647;
	int min = 2147483647;
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
		int num = atoi(str);
		if( num < min)
			min = num;
		if( num > max)
			max = num;
	}
	printf("%d\n", (max - min));

	fclose(fp);
	return 0;
}