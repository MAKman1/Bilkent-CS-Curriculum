/**
* Title: Algorithm Efficiency and Sorting
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 2
* Details: HW 2
**/

#ifndef BSTNODE_H
#define BSTNODE_H

#include <string.h>
using namespace std;

class BSTNode{
public:
    BSTNode();
    BSTNode( const int item, BSTNode *left = NULL, BSTNode *right = NULL);

private:
    BSTNode *left;
    BSTNode *right;
    int     item;

    friend class BST;
};

#endif
