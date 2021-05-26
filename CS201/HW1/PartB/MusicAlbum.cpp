#include <iostream>
#include <string>
#include "MusicAlbum.h"
using namespace std;

MusicAlbum::MusicAlbum( const string maArtist,
                        const string maTitle,
                        const int maYear){
    title = maTitle;
    artist = maArtist;
    year = maYear;
    //initializing pointer to null to avoid errors/ dangling pointers
    noSongs = 0;
    songs = NULL;
}
MusicAlbum::~MusicAlbum(){
    //no need to check if pointer is null: unnecessary
    delete [] songs;
}
MusicAlbum::MusicAlbum( const MusicAlbum &maToCopy){
    //copying basic data
    title = maToCopy.title;
    artist = maToCopy.artist;
    year = maToCopy.year;
    noSongs = maToCopy.noSongs;

    //copying songs: deep copy
    if( maToCopy.noSongs == 0){
        songs = NULL;
    }
    else{
        songs = new Song[ noSongs];
        for( int i = 0; i < noSongs; i++){
            //utilizing the overloaded copying operator from Songs class
            songs[i] = maToCopy.songs[i];
        }
    }
}
void MusicAlbum::operator = (const MusicAlbum &right){
    //checking if same to avoid unnecessary copying overhead
    if( this != &right){
        title = right.title;
        artist = right.artist;
        year = right.year;
        noSongs = right.noSongs;

        //deallocating any previous memory assigned from heap
        delete [] songs;

        //deep copying data
        if( right.songs == NULL){
            songs = NULL;
        }
        else{
            songs = new Song[ noSongs];
            for( int i = 0; i < noSongs; i++){
                songs[i] = right.songs[i];
            }
        }
    }
}
string MusicAlbum::getMusicAlbumArtist(){
    return artist;
}
string MusicAlbum::getMusicAlbumTitle(){
    return title;
}
int MusicAlbum::getMusicAlbumYear(){
    return year;
}
void MusicAlbum::calculateMusicAlbumLength( int &minutes, int &seconds){
    //initializing both to avoid garbage values
    minutes = 0;
    seconds = 0;
    if( noSongs > 0){
        int totalSeconds = 0;
        for( int i = 0; i < noSongs; i++){
            //calculating total length of songs in seconds
            totalSeconds = totalSeconds + songs[ i].getSongSecs() + (songs[ i].getSongMins() * 60);
        }
        //converting seconds to minutes + seconds
        seconds = totalSeconds % 60;
        minutes = (totalSeconds - seconds) / 60;
    }
}
bool MusicAlbum::addSong( const string sName, const int sMins, const int sSecs){
    if( noSongs == 0){
        //just adding a song if no songs present
        noSongs++;
        songs = new Song[ noSongs];
        songs[ 0] = Song( sName, sMins, sSecs);
        return true;
    }
    else{
        //checking if song is already present
        for( int count = 0; count < noSongs; count++){
            if( songs[count].getSongName() == sName){
                //exiting with false if present
                return false;
            }
        }
        //if song not present
        noSongs++;

        Song *tempCollection = songs;
        songs = new Song[ noSongs];

        for( int i = 0; i < noSongs - 1; i++){
            songs[i] = tempCollection[i];
        }
        songs[ noSongs - 1] = Song( sName, sMins, sSecs);

        //deleting previous collection
        delete [] tempCollection;
        return true;
    }
}
bool MusicAlbum::removeSongs(){
    if( noSongs > 0){
        //if songs are found, delete all songs
        noSongs = 0;
        delete [] songs;
        //assigning songs to null to avoid faulty pointers
        songs = NULL;
        return true;
    }
    else
        return false;
}
