/**
* Title: Running Median
* Author: Muhammad Arham Khan
* ID: 21701848
* Section: 3
* Assignment: 3
* Details: HW 3
**/

#include <iostream>
#include <fstream>
#include "HuffmanHeap.h"
#include "HuffmanCode.h"
#include "string.h"
using namespace std;
const int MAX_INPUT_ARRAY_SIZE = 200;

void populate( MinHeapNode* root, string currentString, ofstream* file){
    if( root == NULL){
        return;
    }
    else if( root->left == NULL && root->right == NULL){
        cout << root->character << " : " << currentString << endl;
        *file << (root->character + " : " + currentString + "\n");
    }
    else{
        populate( root->left, currentString + '0', file);
        populate( root->right, currentString + '1', file);
    }
}
void populateFile( MinHeapNode* root, const char* filename){
    ofstream file;
    file.open ( filename, ofstream::app);
    populate( root, "", &file);
    //  file.close();

}
int inputData( const char* filename, char chars[], int freqs[]){
    int counter = 0;
    ifstream file( filename);
    if (file.is_open()) {
        int freq;
        char character;
        while (file >> character >> freq){
            chars[counter] = character;
            freqs[counter] = freq;
            counter++;
        }
    }
    file.close();
    return counter;
}
int main(){

    HuffmanCode hc;
    char characters[MAX_INPUT_ARRAY_SIZE];
    int freq[MAX_INPUT_ARRAY_SIZE];


    characters[0] = 'a';
    characters[1] = 'b';
    characters[2] = 'c';
    characters[3] = 'd';
    characters[4] = 'e';
    characters[5] = 'f';

    freq[0] = 45;
    freq[1] = 13;
    freq[2] = 12;
    freq[3] = 16;
    freq[4] = 9;
    freq[5] = 5;


    //int inputSize = inputData( "testfile.txt", characters, freq);

    MinHeapNode* root = hc.doHuffman( characters, freq, 6);


    populateFile( root, "output.txt");


}
