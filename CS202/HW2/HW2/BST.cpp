/**
* Title: Algorithm Efficiency and Sorting
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 2
* Details: HW 2
**/


#include "BST.h"
#include <iostream>
#include <string.h>
using namespace std;

BST::BST(){
    root = NULL;
}
BST::~BST(){
    //destroying tree
    deleteTree( root);
}
void BST::deleteTree( BSTNode *root){
    //clearing all nodes
    if (root != NULL){
        deleteTree(root->left);
        deleteTree(root->right);
        delete root;
        root = NULL;
    }
}
void BST::insertItem(int key){
    insertRecursively( key, root);
}
void BST::insertRecursively( int key, BSTNode *&node){
    //finding the free node
    if (node == NULL) {
        node = new BSTNode( key);
    }
    else if (key < node->item)
        insertRecursively(key, node->left);
        //seeing the direction to go to
    else
        insertRecursively(key, node->right);
}
void BST::deleteItem(int key){
    deleteItemRecursively( key, root);
}
void BST::deleteItemRecursively( int key, BSTNode *&root){
    if (root == NULL) // Empty tree
        cout << "Error: node not found" << endl;
    // Position of deletion found
    else if (key == root->item){
        deleteNodeItem( root);
    }
    // Else search for the deletion position
    else if (key < root->item)
        deleteItemRecursively(key, root->left);
    else
        deleteItemRecursively(key, root->right);
}
void BST::deleteNodeItem( BSTNode *&node){
    BSTNode *delPtr;
    int replacementItem;


    // (1)  Test for a leaf
    if ( (node->left == NULL) &&
         (node->right == NULL) ) {
        delete node;
        node = NULL;
    }
    // (2)  Test for no left child
    else if (node->left == NULL){
        delPtr = node;
        node = node->right;
        delPtr->right = NULL;
        delete delPtr;
    }
    else if (node->right == NULL) {
        delPtr = node;
        node = node->left;
        delPtr->left = NULL;
        delete delPtr;
    }
    else {
        processLeftMost(node->right, replacementItem);
        node->item = replacementItem;
    }
}
void BST::processLeftMost(BSTNode *&node,
						  int& treeItem){

		if (node->left == NULL) {
			treeItem = node->item;
			BSTNode *delPtr = node;
			node = node->right;
			delPtr->right = NULL; // defense
			delete delPtr;
		}
		else
			processLeftMost(node->left, treeItem);
}

BSTNode* BST::retrieveItem(int key){
    //iterating through nodes
    BSTNode *currNode = root;
    bool done = false;
    while( currNode != NULL && !done){
        //finding if node found
        if( currNode->item == key)
            done = true;
        //deciding the direction to go to
        else if( currNode->item > key)
            currNode = currNode->left;
        else
            currNode = currNode->right;
    }
    return currNode;
}
int* BST::inorderTraversal(int& length){
    //calling auxiliary function to recursively iterate
    length = 0;
    getLength( length, root);

    int currCount = 0;
    int *retrievedData = new int[ length];
    traverseRecursively( root, currCount, retrievedData);
    return retrievedData;
}
void BST::getLength( int &length, BSTNode *root){
    if( root == NULL){
        return;
    }
    else{
        getLength( length, root->left);
        getLength( length, root->right);
        length++;
    }
}
void BST::traverseRecursively( BSTNode *root, int &currentCount, int *output){
    //if end reached terminate
    if( root == NULL)
        return;
    else{
        //traverse left
        traverseRecursively( root->left, currentCount, output);

        //account for current
        output[ currentCount] = root->item;
        currentCount++;

        //traverse right
        traverseRecursively( root->right, currentCount, output);
    }
}
bool BST::containsSequence( int* seq, int length){
    bool isEqual = false;
    int currCount = 0;
    int traverseCount = 0;
    compareRecursively( root, seq, currCount, traverseCount, length, isEqual);
    return isEqual;
}
void BST::compareRecursively( BSTNode* root, int* seq, int &currCount, int &traverseCount, int length, bool &isEqual){
    //comparing elements to see if sequence terminated or tree ended
    if( currCount > length - 1 || root == NULL ){
        return;
    }
    else{
        if( root->item > seq[ currCount])
            compareRecursively( root->left, seq, currCount,traverseCount, length, isEqual);
        //seeing if the element matches sequence
        if( currCount < length){
            //cout << root->item << endl;
            bool comparison = (seq[ currCount] == root->item);
            if( comparison == true){
                isEqual = true;
                currCount++;
            }
            else{
                isEqual = false;
                currCount = 1;
            }
        }
        if( root->item < seq[ currCount])
            //seeing same function for right
            compareRecursively( root->right, seq, currCount, traverseCount, length, isEqual);
    }
}
int BST::countNodesDeeperThan(int level){
    int currentLevel = 1;
    int nodeCount = 0;
    deeperNodesRecursively( root, level, currentLevel, nodeCount);
    return nodeCount;
}
void BST::deeperNodesRecursively( BSTNode *node, int level, int currentLevel, int &nodeCount){
    if( node == NULL)
        return;
    else{
        //if level is required higher, increment variable
        if( currentLevel >= level)
            nodeCount++;

        currentLevel++;
        //do same for left ad right subtrees
        deeperNodesRecursively( node->left, level, currentLevel, nodeCount);
        deeperNodesRecursively( node->right, level, currentLevel, nodeCount);
    }
}

int BST::maxBalancedHeight(){
    //initializing min to high number
    int currentMinimum = 99999;
    int height = 1;
    balancedNodesRecursively( root, currentMinimum, height);
    return currentMinimum;
}

void BST::balancedNodesRecursively( BSTNode *node, int &currentMinimum, int height){
    if( node->right == NULL && node->left == NULL){
        //comparing min height from nodes and changing
        if( height < currentMinimum)
            currentMinimum = height;
        return;
    }
    else{
        //incrementing height for the next level nodes
        height++;
        if( node->left != NULL)
            balancedNodesRecursively( node->left, currentMinimum, height);
        if( node->right != NULL)
            balancedNodesRecursively( node->right, currentMinimum, height);
    }
}
void BST::findMinimum( int &a, int &b){
    findMin( root, a, b);
}
void BST::findMin( BSTNode *root, int &a, int &b){
    if( root == NULL){
        return;
    }
    else{
        findMin( root->left, a, b);

        if( (root->item - b) < (b - a)){
            a = b;
            b = root->item;
            if( a == 9999999){
                a = -9999999;
            }
            int temp1 = a;
            int temp2 = b;
            findMin( root->right, temp1, temp2);
            if( temp2 - temp1 < b - a){
                a = temp1;
                b = temp2;
            }
        }else{
            findMin( root->right, a, b);
        }
    }
}
