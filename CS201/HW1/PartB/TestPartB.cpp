#include <iostream>
#include "MusicAlbum.h"
#include "MAC.h"
using namespace std;

void displayAllMusicAlbums(MAC mac){
    MusicAlbum *allMusicAlbums;
    int noOfMusicAlbums = mac.getMusicAlbums(allMusicAlbums);

    cout << "No of music albums: " << noOfMusicAlbums << endl;
    for( int i = 0; i < noOfMusicAlbums; i++){
        cout << allMusicAlbums[i].getMusicAlbumArtist() << ", "
             << allMusicAlbums[i].getMusicAlbumTitle() << " ("
             << allMusicAlbums[i].getMusicAlbumYear() << ") "
             << endl;
    }
    if( allMusicAlbums != NULL)
        delete [] allMusicAlbums;
}
void displayStatistics( MAC mac){
    MusicAlbum *allMusicAlbums;
    int noOfMusicAlbums = mac.getMusicAlbums(allMusicAlbums);
    int count[8] = {0};
    int mins, secs;

    for( int i = 0; i < noOfMusicAlbums; i++){
        allMusicAlbums[i].calculateMusicAlbumLength(mins, secs);

        if( mins < 70)
            count[mins/10]++;
        else
            count[7]++;
    }
    for( int i = 0; i < 7; i++)
        if( count[i] > 0)
            cout << "Number of albums with running time in [ "
                 << i * 10 << (i + 1) * 10 << ") minutes: "
                 << count[i] << endl;
    if( count[7] > 0)
        cout << "Number of albums with running time >= 70 "
             << "minutes: " << count[7] << endl;
    mac.calculateAvgMusicAlbumLength( mins, secs);
    cout << "Average album running time: " << mins
         << " minutes, " << secs << " seconds" << endl;

    if( allMusicAlbums != NULL)
        delete [] allMusicAlbums;
}

int main(){
    MAC m;

    m.addMusicAlbum( "John Coltrane", "My Favorite Things", 1961);
    m.addSong("John Coltrane", "My Favorite Things", "My Favorite Things", 13, 44);
    m.addSong("John Coltrane", "My Favorite Things", "Ever’y Time We Say Goodbye", 5, 43);
    m.addSong("John Coltrane", "My Favorite Things", "Summertime", 11, 36);
    m.addSong("John Coltrane", "My Favorite Things", "But Not For Me", 9, 35);
    m.addMusicAlbum("John Coltrane", "A Love Supreme", 1965);
    m.addSong("John Coltrane", "A Love Supreme", "Acknowledgement", 7, 48);
    m.addSong("John Coltrane", "A Love Supreme", "Resolution", 7, 25);
    m.addSong("John Coltrane", "A Love Supreme", "Pursuance", 10, 46);
    m.addSong("John Coltrane", "A Love Supreme", "Psalm", 7, 05);
    m.addMusicAlbum("Jethro Tull", "Thick As A Brick", 1972);
    m.addSong("Jethro Tull", "Thick As A Brick", "Thick As A Brick, Part 1", 22, 45);
    m.addSong("Jethro Tull", "Thick As A Brick", "Thick As A Brick, Part 2", 21, 05);
    m.addMusicAlbum("Mike Oldfield", "Tubular Bells", 1973);
    m.addSong("Mike Oldfield", "Tubular Bells", "Part One", 25, 00);
    m.addSong("Mike Oldfield", "Tubular Bells", "Part Two", 23, 50);
    m.removeMusicAlbum("John Coltrane", "My Favorite Things");
    displayAllMusicAlbums(m);
    displayStatistics(m);
    return 0;
}
