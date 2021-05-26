#ifndef __SONG_H
#define __SONG_H

#include <string>
using namespace std;

class Song {
public:
    Song( const string sName = "", const int sMins = 0,
         const int sSecs = 0);

     ~Song();

     Song( const Song &songToCopy);

     void operator = (const Song &right);

     int getSongMins();

     int getSongSecs();

     string getSongName();

private:
    string name;
    int mins;
    int secs;
};
#endif // __SONG_H
