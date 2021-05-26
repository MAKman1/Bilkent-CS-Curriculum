/**
* Title: Running Median
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 3
* Details: HW 3
**/

#ifndef MAXHEAP_H
#define MAXHEAP_H

const int MAX_HEAP_SIZE = 200;
using namespace std;

class MaxHeap{
public:
    MaxHeap();

    void insert (int value ); // inserts integer into heap
    int peek (); // returns the value of the max element
    int extractMax (); // retrieves and removes the max element
    int size (); // returns the number of elements in the heap

    void heapRebuild( int root);


    int items[ MAX_HEAP_SIZE];	// array of heap items

private:
    //int items[ MAX_HEAP_SIZE];	// array of heap items
	int currentSize;
};

#endif

