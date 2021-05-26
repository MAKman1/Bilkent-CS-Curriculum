/**
* Title: Algorithm Efficiency and Sorting
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 1
* Details: HW 1
**/

#include "sorting.h"
#include <cmath>
#include <stdlib.h>
#include <time.h>
#include <iostream>
using namespace std;

void printArray( int *arr, int size){
    cout << "[ ";
    for( int i = 0; i < size; i++){
        cout << arr[i] << ", ";
    }
    cout << " ]" << endl;
}
void bubbleSort(int *arr, int size, int &compCount, int &moveCount){
    bool sorted = false;
	for (int pass = 1; (pass < size) && !sorted; ++pass) {
      sorted = true;
      for (int index = 0; index < size-pass; ++index) {
         int nextIndex = index + 1;
         compCount++;
         if (arr[index] > arr[nextIndex]) {
            moveCount += 3;
            swap(arr[index], arr[nextIndex]);
            sorted = false;
         }
      }
   }

}
void quickSort(int *arr, int size, int &compCount, int &moveCount){
    quickImplementation( arr, 0, size - 1, compCount, moveCount);
}
void quickImplementation(int *arr, int first, int last, int &compCount, int &moveCount){
    int pivotIndex;

    if (first < last) {

      // create the partition: S1, pivot, S2
      quickPartition(arr, first, last, pivotIndex, compCount, moveCount);

      // sort regions S1 and S2
      quickImplementation(arr, first, pivotIndex-1 , compCount, moveCount);
      quickImplementation(arr, pivotIndex+1, last , compCount, moveCount);
    }
}
void quickPartition(int *arr, int first, int last, int &pivotIndex, int &compCount, int &moveCount){

    int pivot = arr[first]; // copy pivot
    moveCount++;
    int lastS1 = first;           // index of last item in S1
    int firstUnknown = first + 1; // index of first item in unknown

	// move one item at a time until unknown region is empty
    for (  ; firstUnknown <= last; ++firstUnknown) {
      compCount++;
      if (arr[firstUnknown] < pivot) {  	// belongs to S1
		  ++lastS1;
          moveCount+=3;
    	  swap(arr[firstUnknown], arr[lastS1]);
      }	// else belongs to S2
   }
   moveCount+=3;
   swap(arr[first], arr[lastS1]);
   pivotIndex = lastS1;
}


void mergeSort(int *arr, int size, int &compCount, int &moveCount){
    mergeImplementation( arr, 0, size - 1, compCount, moveCount);
}
void mergeImplementation(int *arr, int first, int last, int &compCount, int &moveCount) {
	if (first < last) {
      int mid = (first + last)/2;
      mergeImplementation(arr, first, mid, compCount, moveCount);
      mergeImplementation(arr, mid+1, last, compCount, moveCount);
      mergeList(arr, first, mid, last, compCount, moveCount);
   }
}
void mergeList(int *arr, int first, int mid, int last, int &compCount, int &moveCount) {

	int tempArray[31000]; 	// temporary array

	int first1 = first; 	// beginning of first subarray
    int last1 = mid; 		// end of first subarray
    int first2 = mid + 1;	// beginning of second subarray
    int last2 = last;		// end of second subarray
    int index = first1; // next available location in tempArray

    for ( ; (first1 <= last1) && (first2 <= last2); ++index) {
       compCount++;
       if (arr[first1] < arr[first2]) {
         moveCount++;
         tempArray[index] = arr[first1];
         ++first1;
       }
       else {
          moveCount++;
          tempArray[index] = arr[first2];
          ++first2;
       }
    }
    // finish off the first subarray, if necessary
    for (; first1 <= last1; ++first1, ++index){
      moveCount++;
      tempArray[index] = arr[first1];
    }
   // finish off the second subarray, if necessary
    for (; first2 <= last2; ++first2, ++index){
      moveCount++;
      tempArray[index] = arr[first2];
    }
   // copy the result back into the original array
    for (index = first; index <= last; ++index){
        moveCount++;
        arr[index] = tempArray[index];
    }
}

void radixSort( int* arr, int size){
    //finding the max number
    int max = 0;
    for( int i = 0; i < size; i++){
        if( abs(arr[i]) > max){
            max = abs(arr[i]);
        }
    }
    int base = 10;
    while( max > 0){
        countingSort( arr, size, base);
        base *= 10;
        max = max / 10;
    }
}
int fixBase( int number, int base){
    int num = number % base;
    for( int i = 10; i < base; i *= 10){
        num = num / 10;
    }
    return num;
}
void countingSort( int* arr, const int size, int base){
    int appCount[19] = {0};
    int output[ 31000] = {0};
    //finding the end counts
    for( int i = 0; i < size; i++){
        appCount[ fixBase( arr[ i], base) + 9]++;
    }
    //fixing the begin positions
    for( int i = 1; i < 19; i++){
        appCount[i] = appCount[i] + appCount[ i-1];
    }
    //shifting indexes for array arrangement
    for( int i = 18; i > 0; i--){
        appCount[i] = appCount[ i - 1];
    }
    appCount[0] = 0;
    //making array
    for( int i = 0; i < size; i++){
        int outputIndex = appCount[ fixBase( arr[ i], base) + 9];
        output[ outputIndex] = arr[i];
        appCount[ fixBase( arr[ i], base) + 9]++;
    }
    //shifting changed array to original
    for( int i = 0; i < size; i++){
        arr[i] = output[i];
    }
}

void performanceAnalysis(){
    const int ARRAY_SIZE[8] = {2000, 6000, 10000, 14000, 18000, 22000, 26000, 30000};
    int SAMPLE_1[4][2000];
    int SAMPLE_2[4][6000];
    int SAMPLE_3[4][10000];
    int SAMPLE_4[4][14000];
    int SAMPLE_5[4][18000];
    int SAMPLE_6[4][22000];
    int SAMPLE_7[4][26000];
    int SAMPLE_8[4][30000];
    //input generation
    for( int j = 0; j < 2000; j++){
            if( rand() % 2 == 1)
                SAMPLE_1[0][j] = rand();
            else
                SAMPLE_1[1][j] = -1 * rand();
            SAMPLE_1[1][j] = SAMPLE_1[0][j];
            SAMPLE_1[2][j] = SAMPLE_1[0][j];
            SAMPLE_1[3][j] = SAMPLE_1[0][j];
    }
    for( int j = 0; j < 6000; j++){
            if( rand() % 2 == 1)
                SAMPLE_2[0][j] = rand();
            else
                SAMPLE_2[0][j] = -1 * rand();
            SAMPLE_2[1][j] = SAMPLE_2[0][j];
            SAMPLE_2[2][j] = SAMPLE_2[0][j];
            SAMPLE_2[3][j] = SAMPLE_2[0][j];
    }
    for( int j = 0; j < 10000; j++){
            if( rand() % 2 == 1)
                SAMPLE_3[0][j] = rand();
            else
                SAMPLE_3[0][j] = -1 * rand();
            SAMPLE_3[1][j] = SAMPLE_3[0][j];
            SAMPLE_3[2][j] = SAMPLE_3[0][j];
            SAMPLE_3[3][j] = SAMPLE_3[0][j];
    }
    for( int j = 0; j < 14000; j++){
            if( rand() % 2 == 1)
                SAMPLE_4[0][j] = rand();
            else
                SAMPLE_4[0][j] = -1 * rand();
            SAMPLE_4[1][j] = SAMPLE_4[0][j];
            SAMPLE_4[2][j] = SAMPLE_4[0][j];
            SAMPLE_4[3][j] = SAMPLE_4[0][j];
    }
    for( int j = 0; j < 18000; j++){
            if( rand() % 2 == 1)
                SAMPLE_5[0][j] = rand();
            else
                SAMPLE_5[0][j] = -1 * rand();
            SAMPLE_5[1][j] = SAMPLE_5[0][j];
            SAMPLE_5[2][j] = SAMPLE_5[0][j];
            SAMPLE_5[3][j] = SAMPLE_5[0][j];
    }
    for( int j = 0; j < 22000; j++){
            if( rand() % 2 == 1)
                SAMPLE_6[0][j] = rand();
            else
                SAMPLE_6[0][j] = -1 * rand();
            SAMPLE_6[1][j] = SAMPLE_6[0][j];
            SAMPLE_6[2][j] = SAMPLE_6[0][j];
            SAMPLE_6[3][j] = SAMPLE_6[0][j];
    }
    for( int j = 0; j < 26000; j++){
            if( rand() % 2 == 1)
                SAMPLE_7[0][j] = rand() ;
            else
                SAMPLE_7[0][j] = -1 * rand();
            SAMPLE_7[1][j] = SAMPLE_7[0][j];
            SAMPLE_7[2][j] = SAMPLE_7[0][j];
            SAMPLE_7[3][j] = SAMPLE_7[0][j];
    }
    for( int j = 0; j < 30000; j++){
            if( rand() % 2 == 1)
                SAMPLE_8[0][j] = rand();
            else
                SAMPLE_8[0][j] = -1 * rand();
            SAMPLE_8[1][j] = SAMPLE_8[0][j];
            SAMPLE_8[2][j] = SAMPLE_8[0][j];
            SAMPLE_8[3][j] = SAMPLE_8[0][j];
    }


    cout << "--------------------------------------------------------" << endl;
    cout << "Part c - Time analysis of Radix Sort" << endl;
    cout << "Array Size\tTimeElapsed" << endl;
    for( int i = 0; i < 8; i++){

        int *arr1;
        if( i == 0)
            arr1 = SAMPLE_1[0];
        else if( i == 1)
            arr1 = SAMPLE_2[0];
        else if( i == 2)
            arr1 = SAMPLE_3[0];
        else if( i == 3)
            arr1 = SAMPLE_4[0];
        else if( i == 4)
            arr1 = SAMPLE_5[0];
        else if( i == 5)
            arr1 = SAMPLE_6[0];
        else if( i == 6)
            arr1 = SAMPLE_7[0];
        else
            arr1 = SAMPLE_8[0];

        cout << ARRAY_SIZE[i] << "\t\t";

        clock_t start = clock();

        radixSort( arr1, ARRAY_SIZE[i]);

        double time = (((double)(clock() - start)) / CLOCKS_PER_SEC) * 1000;

        cout << time << endl;
    }

    cout << "--------------------------------------------------------" << endl;
    cout << "Part c - Time analysis of Bubble Sort" << endl;
    cout << "Array Size\tTimeElapsed\tcompCount\tmoveCount" << endl;
    for( int i = 0; i < 8; i++){

        int *arr1;
        if( i == 0)
            arr1 = SAMPLE_1[1];
        else if( i == 1)
            arr1 = SAMPLE_2[1];
        else if( i == 2)
            arr1 = SAMPLE_3[1];
        else if( i == 3)
            arr1 = SAMPLE_4[1];
        else if( i == 4)
            arr1 = SAMPLE_5[1];
        else if( i == 5)
            arr1 = SAMPLE_6[1];
        else if( i == 6)
            arr1 = SAMPLE_7[1];
        else
            arr1 = SAMPLE_8[1];

        cout << ARRAY_SIZE[i] << "\t\t";

        int a = 0;
        int b = 0;

        clock_t start = clock();

        bubbleSort( arr1, ARRAY_SIZE[i], a, b);

        double time = (((double)(clock() - start)) / CLOCKS_PER_SEC) * 1000;

        cout << time << "\t\t" << a << "\t\t" << b << endl;
    }

    cout << "--------------------------------------------------------" << endl;
    cout << "Part c - Time analysis of Quick Sort" << endl;
    cout << "Array Size\tTimeElapsed\tcompCount\tmoveCount" << endl;
    for( int i = 0; i < 8; i++){

        int *arr1;
        if( i == 0)
            arr1 = SAMPLE_1[2];
        else if( i == 1)
            arr1 = SAMPLE_2[2];
        else if( i == 2)
            arr1 = SAMPLE_3[2];
        else if( i == 3)
            arr1 = SAMPLE_4[2];
        else if( i == 4)
            arr1 = SAMPLE_5[2];
        else if( i == 5)
            arr1 = SAMPLE_6[2];
        else if( i == 6)
            arr1 = SAMPLE_7[2];
        else
            arr1 = SAMPLE_8[2];

        cout << ARRAY_SIZE[i] << "\t\t";

        int a = 0;
        int b = 0;

        clock_t start = clock();

        quickSort( arr1, ARRAY_SIZE[i], a, b);

        double time = (((double)(clock() - start)) / CLOCKS_PER_SEC) * 1000;

        cout << time << "\t\t" << a << "\t\t" << b << endl;
    }

    cout << "--------------------------------------------------------" << endl;
    cout << "Part c - Time analysis of Merge Sort" << endl;
    cout << "Array Size\tTimeElapsed\tcompCount\tmoveCount" << endl;
    for( int i = 0; i < 8; i++){

        int *arr1;
        if( i == 0)
            arr1 = SAMPLE_1[3];
        else if( i == 1)
            arr1 = SAMPLE_2[3];
        else if( i == 2)
            arr1 = SAMPLE_3[3];
        else if( i == 3)
            arr1 = SAMPLE_4[3];
        else if( i == 4)
            arr1 = SAMPLE_5[3];
        else if( i == 5)
            arr1 = SAMPLE_6[3];
        else if( i == 6)
            arr1 = SAMPLE_7[3];
        else
            arr1 = SAMPLE_8[3];

        cout << ARRAY_SIZE[i] << "\t\t";

        int a = 0;
        int b = 0;

        clock_t start = clock();

        mergeSort( arr1, ARRAY_SIZE[i], a, b);

        double time = (((double)(clock() - start)) / CLOCKS_PER_SEC) * 1000;

        cout << time << "\t\t" << a << "\t\t" << b << endl;
    }
}
