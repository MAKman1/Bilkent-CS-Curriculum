/**
* Title: Running Median
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 3
* Details: HW 3
**/

#include "HuffmanHeap.h"
#include "string.h"
using namespace std;

HuffmanHeap::HuffmanHeap(){
    currentSize = 0;
}

void HuffmanHeap::insert (MinHeapNode* value ){
    if (currentSize < HUFFMAN_HEAP_SIZE - 1){
        // Place the new item at the end of the heap
        items[currentSize] = value;

        // Trickle new item up to its proper position
        int place = currentSize;
        int parent = (place - 1)/2;
        while ( (place > 0) && (items[place]->freq < items[parent]->freq) ) {
            MinHeapNode* temp = items[parent];
            items[parent] = items[place];
            items[place] = temp;

            place = parent;
            parent = (place - 1)/2;
        }
        ++currentSize;
    }
}
MinHeapNode* HuffmanHeap::peek (){
    if( currentSize > 0){
        return items[0];
    }
    return NULL;
}
MinHeapNode* HuffmanHeap::extractMin(){
    if( currentSize > 0){
        MinHeapNode* returnItem = items[0];
		items[0] = items[--currentSize];
		heapRebuild(0);
		return returnItem;
    }
    return NULL;
}
int HuffmanHeap::size (){
    return currentSize;
}

void HuffmanHeap::heapRebuild( int root){
    int child = 2 * root + 1;
	if ( child < currentSize ) {
		int rightChild = child + 1;
		if ( (rightChild < currentSize) && (items[rightChild]->freq < items[child]->freq) )
			child = rightChild;
		if ( items[root]->freq > items[child]->freq ) {
			MinHeapNode* temp = items[root];
			items[root] = items[child];
			items[child] = temp;
			heapRebuild(child);
		}
	}
}
