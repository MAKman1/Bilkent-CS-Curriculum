/**
* Title: Running Median
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 3
* Details: HW 3
**/

#ifndef HUFFMANQUEUE_H
#define HUFFMANQUEUE_H

#include "HuffmanHeap.h"

class HuffmanQueue {
public:
	bool isEmpty();
	void insertQueue(MinHeapNode* newItem);
	MinHeapNode* deleteQueue();

private:
	HuffmanHeap h;
};


#endif
