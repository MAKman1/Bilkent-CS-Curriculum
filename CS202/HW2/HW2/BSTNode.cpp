/**
* Title: Algorithm Efficiency and Sorting
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 2
* Details: HW 2
**/

#include "BSTNode.h"
#include <string.h>
using namespace std;


BSTNode::BSTNode(){
}

BSTNode::BSTNode( const int item, BSTNode *left, BSTNode *right){
    this->left = left;
    this->right = right;
    this->item = item;
}
