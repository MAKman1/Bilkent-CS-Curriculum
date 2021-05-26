/**
* Title: Running Median
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 3
* Details: HW 3
**/

#ifndef HUFFMANCODE_H
#define HUFFMANCODE_H

#include "HuffmanQueue.h"
class HuffmanCode {
public:
	MinHeapNode* doHuffman( char characters[], int frequencies[], int numberOfChars);

private:
	HuffmanQueue hQueue;
};


#endif

