#include "util.h"

void initStringList(StringList *a, size_t initialSize) {
    a->array = (char**) malloc(initialSize * sizeof(char*));
    for (int i = 0; i < initialSize; i++) {
        a->array[i] = (char*) malloc(MAX_READ_LENGTH * sizeof(char));
    }
    a->used = 0;
    a->size = initialSize;
}

void insertStringList(StringList *a, char *element) {
    // a->used is the number of used entries, because a->array[a->used++] updates a->used only *after* the array has been accessed.
    // Therefore a->used can go up to a->size
    if (a->used == a->size) {
        a->size *= 2;
        a->array = (char**) realloc(a->array, a->size * sizeof(char*));
        for (int i = (a->size)/2; i < a->size; i++) {
            a->array[i] = (char*) malloc(MAX_READ_LENGTH * sizeof(char));
        }
    }
    strcpy(a->array[a->used++], element);
}

void freeStringList(StringList *a) {
    for(int i = 0; i < a->size; i++) {
        free(a->array[i]);
    }
    free(a->array);
    a->array = NULL;
    a->used = a->size = 0;
}

int read_file(char *file_name, StringList *sequences) {
    FILE *fp;
    fp = fopen(file_name, "r");
    if(fp) {
        char *line = (char *) malloc( MAX_READ_LENGTH * sizeof(char));
        while (fgets(line, MAX_READ_LENGTH, fp) != NULL) { //A single line only
            //printf("%s", line);
            insertStringList(sequences,line);
        }
        free(line);
        fclose(fp);
        return 0;
    }
    return -1; //Means error
}

//Do not use substring methods for cuda kernel, try a more primitive approach
//without memory operations for performance
void substring(char *source, int begin_index, int end_index)
{
    // copy n characters from source string starting from
    // beg index into destination
    memmove(source, (source + begin_index), end_index-begin_index);
    source[end_index-begin_index] = '\0';
}

void substring(char *destination, char *source, int begin_index, int end_index)
{
    // copy n characters from source string starting from
    // beg index into destination
    memcpy(destination, (source + begin_index), end_index-begin_index);
    destination[end_index-begin_index] = '\0';
}

/*
* You might use these for some simple string operations in GPU
* Put these code into your program

__device__ int d_strlen(const char* string){
    int length = 0;
    while (*string++)
        length++;

    return (length);
}

//Compares string until nth character
__device__ int d_strncmp( const char * s1, const char * s2, size_t n )
{
    while ( n && *s1 && ( *s1 == *s2 ) )
    {
        ++s1;
        ++s2;
        --n;
    }
    if ( n == 0 )
    {
        return 0;
    }
    else
    {
        return ( *(unsigned char *)s1 - *(unsigned char *)s2 );
    }
}
*/
