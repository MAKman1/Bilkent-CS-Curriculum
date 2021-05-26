/**
* Title: Running Median
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 3
* Details: HW 3
**/

#include "MedianHeap.h"
using namespace std;

void MedianHeap::insert( int value){
    if( value > findMedian()){
        minHeap.insert( value);
        if( minHeap.size() > maxHeap.size() + 1){
            int temp = minHeap.extractMin();
            maxHeap.insert( temp);
        }
    }
    else{
        maxHeap.insert( value);
        if( maxHeap.size() > minHeap.size() + 1){
            int temp = maxHeap.extractMax();
            minHeap.insert( temp);
        }
    }
}

int MedianHeap::findMedian(){
    if( minHeap.size() > maxHeap.size()){
        return minHeap.peek();
    }
    else if( maxHeap.size() > minHeap.size()){
        return maxHeap.peek();
    }
    else{
        if( minHeap.peek() > maxHeap.peek()){
            return minHeap.peek();
        }
        else{
            return maxHeap.peek();
        }
    }
}

