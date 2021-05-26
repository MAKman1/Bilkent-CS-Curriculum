#include <iostream>
#include <string>
#include "Song.h"
using namespace std;

Song::Song( const string sName, const int sMins,
            const int sSecs){
    //copying data
    name = sName;
    mins = sMins;
    secs = sSecs;
}
//because no heap memory allocated
Song::~Song(){}

Song::Song( const Song &songToCopy){
    name = songToCopy.name;
    mins = songToCopy.mins;
    secs = songToCopy.secs;
}

void Song::operator = (const Song &right){
    //checking is same pointer to avoid unnecessary copying overhead
    if( &right != this){
        name = right.name;
        mins = right.mins;
        secs = right.secs;
    }
}
int Song::getSongMins(){
    return mins;
}
int Song::getSongSecs(){
    return secs;
}
string Song::getSongName(){
    return name;
}
