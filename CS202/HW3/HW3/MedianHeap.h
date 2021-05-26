/**
* Title: Running Median
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 3
* Details: HW 3
**/

#ifndef MEDIANHEAP_H
#define MEDIANHEAP_H

#include "MaxHeap.h"
#include "MinHeap.h"
using namespace std;

class MedianHeap{
public:
    void insert (int value ); // inserts an element into MedianHeap
    int findMedian (); // returns the value of the median

    MinHeap minHeap;
    MaxHeap maxHeap;

private:
    //MinHeap minHeap;
    //MaxHeap maxHeap;
};

#endif

