/**
* Title : Balanced Search Trees , Hashing and Graphs
* Author : Muhammad Arham Khan
* ID: 21701848
* Section : 03
* Assignment : 4
* Description : Best code eva!
*/

/**
 * CS 202 - HW 4
 * A main file
 * Please make sure that your code compiles and runs with this main file
 */

#include "graph.h"
#include <string>
#include <iostream>
#include <fstream>
/*You can add additional libraries here to read and process the dataset*/

using namespace std;

int stringToInteger( string input){
    int mul = 1;
    int output = 0;
    int a = 0;
    while( input[a] != '\0'){
        a++;
    }
    a--;

    for( int i = a; i >= 0; i--){
        output += (input[i] - 48) * mul;
        mul *= 10;
    }
    return output;
}
int main() {
    Graph g;
	string line;
	int pos, size;
    string currentInput;



    ifstream inputFile("flightDataset.txt");
    if (inputFile.is_open()){
        while ( getline (inputFile, currentInput) ){

            int currentIndex = 0;
            string airport1 = "";
            string airport2 = "";
            string num = "";

            while( currentInput[currentIndex] != ';'){
                airport1 = airport1 + currentInput[currentIndex];
                currentIndex++;
            }
            currentIndex++;
            while( currentInput[currentIndex] != ';'){
                airport2 = airport2 + currentInput[currentIndex];
                currentIndex++;
            }
            currentIndex++;
            while( currentInput[currentIndex] != '\0'){
                num = num + currentInput[currentIndex];
                currentIndex++;
            }
            g.addAirport( airport1);
            g.addAirport( airport2);
            g.addConnection( airport1, airport2, stringToInteger( num));
        }
        inputFile.close();
    } else{
        cout << "file not found" << endl;
    }

    list <string> results = g.findShortestPath("DUNDEE", "INVERNESS");
    list <string> ::iterator iteration;
	cout << "SHORTEST PATH: " << endl;
	for (iteration = results.begin(); iteration != results.end(); ++iteration) {
		cout << *iteration << endl;
	}

    results = g.getAdjacentAirports("LONDON CITY");
	cout << "Adjacent airport: ";
	for (iteration = results.begin(); iteration != results.end(); ++iteration) {
		cout << *iteration << endl;
	}

	cout << endl;

	int passangers = g.getTotalPassengers("DUNDEE");
	cout << "Total passengers: " << passangers << endl;


	cout << endl;

	cout << "MST function:" << endl;
	list <pair <string, string> > ::iterator iter;
	list <pair <string, string> > pair = g.findMST();
	for (iter = pair.begin(); iter != pair.end(); ++iter) {
		cout << iter->first << "  -- <> --  " << iter->second << endl;
	}

	g.deleteAirport("DUNDEE");


	cout << "MST function:" << endl;
	pair = g.findMST();
	for (iter = pair.begin(); iter != pair.end(); ++iter) {
		cout << iter->first << "  -- <> --  " << iter->second << endl;
	}

	return 0;
}
// End of main file
