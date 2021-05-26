/**
* Title: Running Median
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 3
* Details: HW 3
**/

#include "MaxHeap.h"
using namespace std;

MaxHeap::MaxHeap(){
    currentSize = 0;
}


void MaxHeap::insert( int value){
    if (currentSize < MAX_HEAP_SIZE - 1){
        // Place the new item at the end of the heap
        items[currentSize] = value;

        // Trickle new item up to its proper position
        int place = currentSize;
        int parent = (place - 1)/2;
        while ( (place > 0) && (items[place] > items[parent]) ) {
            int temp = items[parent];
            items[parent] = items[place];
            items[place] = temp;

            place = parent;
            parent = (place - 1)/2;
        }
        ++currentSize;
    }
}
int MaxHeap::peek(){
    if( currentSize > 0){
        return items[0];
    }
    return -1;
}
int MaxHeap::extractMax(){
    if( currentSize > 0){
        int returnItem = items[0];
		items[0] = items[--currentSize];
		heapRebuild(0);
		return returnItem;
    }
    return -1;
}
void MaxHeap::heapRebuild( int root){
    int child = 2 * root + 1;
	if ( child < currentSize ) {
		int rightChild = child + 1;
		if ( (rightChild < currentSize) && (items[rightChild] >items[child]) )
			child = rightChild;
		if ( items[root] < items[child] ) {
			int temp = items[root];
			items[root] = items[child];
			items[child] = temp;
			heapRebuild(child);
		}
	}
}
int MaxHeap::size(){
    return currentSize;
}
