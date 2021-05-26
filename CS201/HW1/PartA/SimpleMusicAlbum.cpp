#include <iostream>
#include <string>
#include "SimpleMusicAlbum.h"
using namespace std;

MusicAlbum::MusicAlbum( const string maArtist,
                              const string maTitle,
                              const int maYear){
    //copying all data
    artist = maArtist;
    title = maTitle;
    year = maYear;
}

MusicAlbum::~MusicAlbum(){}

MusicAlbum::MusicAlbum( const MusicAlbum &maToCopy){
    artist = maToCopy.artist;
    title = maToCopy.title;
    year = maToCopy.year;
}

void MusicAlbum::operator = ( const MusicAlbum &right){
    //checking if right != current one to avoid unnecessary copying overhead
    if( &right != this){
        artist = right.artist;
        title = right.title;
        year = right.year;
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


