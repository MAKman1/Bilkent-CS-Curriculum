/**
* Title: Algorithm Efficiency and Sorting
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 1
* Details: HW 1
**/

#ifndef MAIN_SORTING_H
#define MAIN_SORTING_H

void bubbleSort(int *arr, int size, int &compCount, int &moveCount);

void quickSort(int *arr, int size, int &compCount, int &moveCount);
void quickImplementation(int *arr, int first, int last, int &compCount, int &moveCount);
void quickPartition(int *arr, int first, int last, int &pivotIndexint, int &compCount, int &moveCount);

void mergeSort(int *arr, int size, int &compCount, int &moveCount);
void mergeImplementation(int *arr, int first, int last, int &compCount, int &moveCount);
void mergeList(int *arr, int first, int mid, int last, int &compCount, int &moveCount);

void radixSort( int* arr, int size);
void countingSort( int* arr, int size, int base);
int fixBase( int number, int base);

void printArray(int *arr, int size);

void performanceAnalysis();

#endif //MAIN_SORTING_H
