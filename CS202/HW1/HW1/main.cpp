/**
* Title: Algorithm Efficiency and Sorting
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 1
* Details: HW 1
**/

#include <iostream>
#include "sorting.h"
using namespace std;


int main() {
    int a = 0;
    int b = 0;
    int temp1[16] = {7, 3, 6, 12, 13, 4, 1, 9, 15, 0, 11, 14, 2, 8, 10, 5};
    int temp2[16] = {7, 3, 6, 12, 13, 4, 1, 9, 15, 0, 11, 14, 2, 8, 10, 5};
    int temp3[16] = {7, 3, 6, 12, 13, 4, 1, 9, 15, 0, 11, 14, 2, 8, 10, 5};
    int temp4[16] = {7, 3, 6, 12, 13, 4, 1, 9, 15, 0, 11, 14, 2, 8, 10, 5};

    bubbleSort( temp1, 16, a, b);
    printArray( temp1, 16);

    quickSort( temp2, 16, a, b);
    printArray( temp2, 16);

    mergeSort( temp3, 16, a, b);
    printArray( temp3, 16);

    radixSort( temp4, 16);
    printArray( temp4, 16);

    performanceAnalysis();
    return 0;
}


