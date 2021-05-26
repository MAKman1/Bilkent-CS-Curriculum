/**
* Title: Running Median
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 3
* Details: HW 3
**/

#ifndef HUFFMANHEAP_H
#define HUFFMANHEAP_H

const int HUFFMAN_HEAP_SIZE = 128;
#include "string.h"
using namespace std;

struct MinHeapNode
{
    //MinHeapNode() : left(NULL), right(NULL) {}
    char character; // An input character
    int freq; // Frequency of the character
    MinHeapNode* left;
    MinHeapNode* right; // Left and right child
};

class HuffmanHeap{
public:

    HuffmanHeap();

    void insert (MinHeapNode* value ); // inserts integer into heap
    MinHeapNode* peek (); // returns the value of the min element
    MinHeapNode* extractMin (); // retrieves and removes the min element
    int size (); // returns the number of elements in the heap

    MinHeapNode* items[ HUFFMAN_HEAP_SIZE];	// array of heap items

private:
    //int items[ HUFFMAN_HEAP_SIZE];	// array of heap items
	int currentSize;
	void heapRebuild( int root);
};

#endif

