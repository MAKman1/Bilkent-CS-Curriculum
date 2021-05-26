/**
* Title: Running Median
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 3
* Details: HW 3
**/

#include "HuffmanCode.h"
#include "string.h"
#include <iostream>
using namespace std;


MinHeapNode* HuffmanCode::doHuffman( char characters[], int frequencies[], int numberOfChars){

    int counter = 0;
    do{
        MinHeapNode* temp = new MinHeapNode;
        temp->character = characters[counter];
        temp->freq = frequencies[counter];
        hQueue.insertQueue( temp);
        counter++;
    } while( counter < numberOfChars);



    for( int i = 1; i < numberOfChars; i++){
        MinHeapNode* insertItem = new MinHeapNode;

        MinHeapNode* left = NULL;
        MinHeapNode* right = NULL;
        if( !hQueue.isEmpty())
            left = hQueue.deleteQueue();
        if( !hQueue.isEmpty())
            right = hQueue.deleteQueue();

        insertItem->left = left;
        insertItem->right = right;
        insertItem->freq = (left->freq) + (right->freq);

        hQueue.insertQueue( insertItem);
    }
    return hQueue.deleteQueue();
}
