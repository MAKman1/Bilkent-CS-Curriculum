/**
* Title: Algorithm Efficiency and Sorting
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 2
* Details: HW 2
**/

#ifndef BST_H
#define BST_H


#include "BSTNode.h"
using namespace std;

class BST{
public:
    BST();
    ~BST();
    void insertItem(int key);
    void deleteItem(int key);
    BSTNode* retrieveItem(int key);
    int* inorderTraversal(int& length);
    bool containsSequence( int* seq, int length);
    int countNodesDeeperThan(int level);
    int maxBalancedHeight();
    void findMinimum( int &a, int &b);


private:
    BSTNode *root;

    void deleteItemRecursively( int key, BSTNode *&root);
    void deleteNodeItem( BSTNode *&node);
    void processLeftMost( BSTNode *&node, int &treeItem);
    void traverseRecursively( BSTNode *root, int &currentCount, int* output);
    void getLength( int& length, BSTNode *root);
    void insertRecursively( int key, BSTNode *&node);
    void compareRecursively( BSTNode* root, int* seq, int &currCount, int &traverseCount, int length, bool &isEqual);
    void deeperNodesRecursively( BSTNode *node, int level, int currentLevel, int &nodeCount);
    void balancedNodesRecursively( BSTNode *node, int &currentMinimum, int height);
    void deleteTree( BSTNode *root);
    void findMin( BSTNode *root, int &a, int &b);
};

#endif
