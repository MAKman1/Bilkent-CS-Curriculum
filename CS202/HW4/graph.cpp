/**
* Title : Balanced Search Trees , Hashing and Graphs
* Author : Muhammad Arham Khan
* ID: 21701848
* Section : 03
* Assignment : 4
* Description : Best code eva!
*/

/** @file graph.cpp
 * An adjacency list representation of an undirected weighted graph.
*/

#include "graph.h"
#include <string.h>
/*Do not add new libraries or files*/

using namespace std;
Graph::Graph()
{
}  // end constructor

void Graph::addAirport(const string& airportName)
{
    if( adjList.find( airportName) == adjList.end())
        adjList.insert( pair< string, list<node> >(airportName, list< node>()));

}  // end addPerformer

void Graph::addConnection(const string& airport1, const string& airport2, int numOfPassengers)
{
    node node1;
    node node2;

    node1.airportName = airport2;
    node1.numOfPassengers = numOfPassengers;

    node2.airportName = airport1;
    node2.numOfPassengers = numOfPassengers;

    map<string, list<node> >::iterator foundNode = adjList.find( airport1);
    if( foundNode == adjList.end())
        cout << "error" << endl;
    else
        foundNode->second.push_back( node1);

    foundNode = adjList.find( airport2);
    if( foundNode == adjList.end())
        cout << "error" << endl;
    else
        foundNode->second.push_back( node2);

}  // end addConnection

list<string> Graph::getAdjacentAirports(const string& airportName)
{
    list<node> nodeList;
    list<string> output;
    list<node>::iterator nodeIterator;

    map<string, list<node> >::iterator foundNode = adjList.find( airportName);
    nodeList = foundNode->second;

    for ( nodeIterator=nodeList.begin(); nodeIterator!=nodeList.end(); ++nodeIterator){
        output.push_back( nodeIterator->airportName);
    }
    return output;
}  // end getAdjacentAirports

int Graph::getTotalPassengers(const string& airportName)
{
    list<node> nodeList;
    int output = 0;
    list<node>::iterator nodeIterator;

    map<string, list<node> >::iterator foundNode = adjList.find( airportName);
    nodeList = foundNode->second;

    for ( nodeIterator=nodeList.begin(); nodeIterator!=nodeList.end(); ++nodeIterator){
        output = output + nodeIterator->numOfPassengers;
    }
    return output;

}  // end getTotalPassengers


list<string> Graph::findShortestPath(const string& airport1, const string& airport2)
{
    list<node> nodeList;
    list<string> output;
    map<string, int> isVisited;
    list<node>::iterator nodeIterator;
    int level = 1;
    bool found = false;

    while(!found){
        map<string, list<node> >::iterator foundNode = adjList.find( airport1);
        nodeList = foundNode->second;

        for ( nodeIterator=nodeList.begin(); nodeIterator!=nodeList.end(); ++nodeIterator){
            list<string> temp;
            bool isFound = false;

            isVisited.clear();
            isVisited.insert( pair< string, int>( airport1, 1) );

            temp.push_back( airport1);

            shortestPath( temp, nodeIterator->airportName, airport2, isFound, isVisited, level, 0);

            if( isFound && (temp.size() < output.size() || output.size() == 0)){
                output = temp;
                found = true;
            }
        }
        level++;
    }

    return output;
}  // end findShortestPath
void Graph::shortestPath(list<string>& airportList, const string currentAirportName, const string& airportName, bool& found, map<string, int> isVisited, int level, int currentLevel)
{
    airportList.push_back( currentAirportName);
    isVisited.insert( pair< string, int>( currentAirportName, 1) );
    if( ++currentLevel > level)
        return;
    if( currentAirportName == airportName){
        found = true;
        return;
    }
    else{
        list<node> nodeList;
        list<string> originalList = airportList;
        list<node>::iterator nodeIterator;
        int initialCount = airportList.size();

        map<string, list<node> >::iterator foundNode = adjList.find( currentAirportName);
        nodeList = foundNode->second;

        for ( nodeIterator=nodeList.begin(); nodeIterator != nodeList.end(); ++nodeIterator){
            if( isVisited.find( nodeIterator->airportName) == isVisited.end()){
                list<string> temp( originalList);
                bool isFound = false;

                shortestPath( temp, nodeIterator->airportName, airportName, isFound, isVisited, level, currentLevel);

                if( isFound && (temp.size() < airportList.size() || airportList.size() == initialCount)){
                    airportList = temp;
                    found = true;
                }
            }
        }
    }
}

list< pair<string, string> > Graph::findMST()
{
    map<string, int> isVisited;
    list< pair<string, string> > output;
    list<node> nodeList;
    int smallest;

    string nextAirportName = adjList.begin()->first;
    string currentAirportName;

    while (isVisited.size() < adjList.size() - 1){

        currentAirportName = nextAirportName;
        smallest = 999999999;
        nextAirportName = "";

        isVisited.insert( pair< string, int>( currentAirportName, 1));

        for (map<string, int>::iterator visitedIterator = isVisited.begin(); visitedIterator != isVisited.end(); visitedIterator++ ){

            map<string, list<node> >::iterator foundNode = adjList.find( visitedIterator->first);
            nodeList = foundNode->second;

            for ( list<node>::iterator nodeIterator = nodeList.begin(); nodeIterator != nodeList.end(); ++nodeIterator){
                if( isVisited.find( nodeIterator->airportName) == isVisited.end() && nodeIterator->numOfPassengers < smallest){
                    smallest = nodeIterator->numOfPassengers;
                    currentAirportName = visitedIterator->first;
                    nextAirportName = nodeIterator->airportName;
                }
            }
        }
        //cout << currentAirportName << " -----<>----- " << nextAirportName << endl;
        output.push_back( pair< string, string>( currentAirportName, nextAirportName));
    }
    return output;
}  // end findMST


void Graph::deleteAirport(const string& airportName)
{
    map<string, list<node> >::iterator foundNode = adjList.find( airportName);
    list<node> nodeList = foundNode->second;

    for ( list<node>::iterator nodeIterator=nodeList.begin(); nodeIterator != nodeList.end(); ++nodeIterator){
        removeItem( nodeIterator->airportName, airportName);
    }

    adjList.erase( airportName);

}  // end deleteAirport

void Graph::removeItem( const string airportListName, const string airport){

    map<string, list<node> >::iterator foundNode = adjList.find( airportListName);

    bool found = false;
    for ( list<node>::iterator nodeIterator=foundNode->second.begin(); (nodeIterator != foundNode->second.end()) && !found; ++nodeIterator){
        if( nodeIterator->airportName == airport){
            foundNode->second.erase( nodeIterator);
            found = true;
        }
    }
}

