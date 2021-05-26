/**
* Title: Running Median
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 3
* Details: HW 3
**/

#include "HuffmanQueue.h"
#include "string.h"
using namespace std;

bool HuffmanQueue::isEmpty(){
    return (h.size() == 0);
}
void HuffmanQueue::insertQueue(MinHeapNode* newItem){
    h.insert( newItem);
}
MinHeapNode* HuffmanQueue::deleteQueue(){
    return h.extractMin();
}
