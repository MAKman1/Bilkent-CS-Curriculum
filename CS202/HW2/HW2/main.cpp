/**
* Title: Algorithm Efficiency and Sorting
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 2
* Details: HW 2
**/

#include <iostream>
#include "BST.h"
using namespace std;

int main(){
    //initializing tree
    BST temp;
    temp.insertItem( 10);
    temp.insertItem( 33);
    temp.insertItem( 18);
    temp.insertItem( 12);
    temp.insertItem( 50);
    temp.insertItem( 188);
    temp.insertItem( 15);
    temp.insertItem( 9);
    temp.insertItem( 5);
    temp.insertItem( 3);

    int first = -9999999;
    int second = 9999999;
    temp.findMinimum( first, second);
    cout << "first is: " << first << endl;
    cout << "second is: " << second << endl;



    /*
    //printing tree
    int length;
    cout << "tree: " << endl;
    int* data = temp.inorderTraversal( length);
    for( int i = 0; i < length; i++){
        cout << data[i] << endl;
    }
    delete[] data;

    //deleting item
    temp.deleteItem( 5);

    //printing tree
    cout << "tree: " << endl;
    data = temp.inorderTraversal( length);
    for( int i = 0; i < length; i++){
        cout << data[i] << endl;
    }

    //attempting to retrieve an item
    BSTNode* a = temp.retrieveItem( 1);
    cout << "item pointer: " << a << endl;

    //finding sequence
    int data2[] = { 3, 6, 7, 10};
    cout << "tree contains sequence: " << temp.containsSequence( data2, 4) << endl;

    //finding level nodes
    cout << "nodes deeper than 2: " << temp.countNodesDeeperThan( 2) << endl;

    cout << "Balanced Height: ";
    cout << temp.maxBalancedHeight() << endl;
    */
}
