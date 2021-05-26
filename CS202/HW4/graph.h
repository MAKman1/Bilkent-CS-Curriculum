/**
* Title : Balanced Search Trees , Hashing and Graphs
* Author : Muhammad Arham Khan
* ID: 21701848
* Section : 03
* Assignment : 4
* Description : Best code eva!
*/

/** @file graph.h */

#include <list>
#include <map>
#include <queue>
#include <string>
#include <iostream>
/*Do not add new libraries or files*/
using namespace std;

struct node {
    string airportName;
    int numOfPassengers;
};

/** An adjacency list representation of an undirected weighted graph. */
class Graph
{
public:

   /** Adjacency list representation of the graph;
    * the map pair consists of the airport (key)
    * and the node list (value). */
   map< string, list<node> > adjList;


   Graph();
   void addAirport(const string& airportName);
   void addConnection(const string& airport1, const string& airport2, int numOfPassengers);
   list<string> getAdjacentAirports(const string& airportName);
   int getTotalPassengers(const string& airportName);
   list<string> findShortestPath(const string& airport1, const string& airport2);
   void shortestPath(list<string>& airportList, string currentAirportName, const string& airportName, bool& found, map<string, int> isVisited, int level, int currentLevel);

   list< pair<string, string> > findMST();

   void deleteAirport(const string& airportName);
   void removeItem( const string airportListName, const string airport);

}; // end Graph
// End of header file
