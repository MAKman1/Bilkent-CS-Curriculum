/**
* Title: Running Median
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 3
* Details: HW 3
**/

#ifndef MINHEAP_H
#define MINHEAP_H
const int MIN_HEAP_SIZE = 200;
using namespace std;

class MinHeap{
public:
    MinHeap();

    void insert (int value ); // inserts integer into heap
    int peek (); // returns the value of the min element
    int extractMin (); // retrieves and removes the min element
    int size (); // returns the number of elements in the heap

    void heapRebuild( int root);

    int items[ MIN_HEAP_SIZE];	// array of heap items

private:
    //int items[ MIN_HEAP_SIZE];	// array of heap items
	int currentSize;
};

#endif

