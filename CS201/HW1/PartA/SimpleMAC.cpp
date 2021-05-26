#include <iostream>
#include <string>
#include "SimpleMAC.h"
using namespace std;

MAC::MAC(){
    //initializing the collection to null and number to 0
    musicAlbums = NULL;
    noOfMusicAlbums = 0;
}

MAC::~MAC(){
    //no need to check if pointer is still null because it adds overhead
    delete [] musicAlbums;
}

MAC::MAC( const MAC &macToCopy){
    noOfMusicAlbums = macToCopy.noOfMusicAlbums;
    if( noOfMusicAlbums > 0){
        musicAlbums = new MusicAlbum[ noOfMusicAlbums];
        //deep copying all elements
        for( int i = 0; i < noOfMusicAlbums; i++){
            musicAlbums[i] = macToCopy.musicAlbums[i];
        }
    }
    else{
        musicAlbums = NULL;
    }
}

void MAC::operator = ( const MAC &right){
    //checking if both pointers point to same address to avoid unnecessary copying
    if( &right != this){
        if( noOfMusicAlbums > 0){
            delete [] musicAlbums;
        }
        noOfMusicAlbums = right.noOfMusicAlbums;
        if( noOfMusicAlbums > 0){
            musicAlbums = new MusicAlbum[ noOfMusicAlbums];
            //copying all elements
            for( int i = 0; i < noOfMusicAlbums; i++){
                musicAlbums[i] = right.musicAlbums[i];
            }
        }
        else{
            //to eliminate the chance of dangling pointers
            musicAlbums = NULL;
        }
    }
}

bool MAC::addMusicAlbum( const string maArtist,
                    const string maTitle,
                    const int maYear){
    if( noOfMusicAlbums == 0){
        noOfMusicAlbums++;
        musicAlbums = new MusicAlbum[ noOfMusicAlbums];
        musicAlbums[ 0] = MusicAlbum( maArtist, maTitle, maYear);
        return true;
    }
    else{
        //finding if element already exists in the array
        for( int count = 0; count < noOfMusicAlbums; count++){
            if( musicAlbums[count].getMusicAlbumArtist() == maArtist && musicAlbums[count].getMusicAlbumTitle() == maTitle){
                //exist with false if element found
                return false;
            }
        }
        //if not found
        noOfMusicAlbums++;

        MusicAlbum *tempCollection = musicAlbums;

        musicAlbums = new MusicAlbum[ noOfMusicAlbums];
        for( int i = 0; i < noOfMusicAlbums - 1; i++){
            musicAlbums[i] = tempCollection[i];
        }
        musicAlbums[ noOfMusicAlbums - 1] = MusicAlbum( maArtist, maTitle, maYear);
        delete [] tempCollection;
        return true;
    }
}

bool MAC::removeMusicAlbum( const string maArtist,
                       const string maTitle){
    //checking if element found
    int removeItemIndex = -1;
    if( noOfMusicAlbums > 0){
        for( int count = 0; count < noOfMusicAlbums; count++){
            if( musicAlbums[count].getMusicAlbumArtist() == maArtist && musicAlbums[count].getMusicAlbumTitle() == maTitle){
                removeItemIndex = count;
            }
        }
        //if element found
        if( removeItemIndex >= 0){

            //making a new collection with one less element
            noOfMusicAlbums--;

            MusicAlbum *tempCollection = musicAlbums;
            musicAlbums = new MusicAlbum[ noOfMusicAlbums];
            //copying data
            for ( int i = 0; i <= noOfMusicAlbums; i++){
                if( i < removeItemIndex){
                    musicAlbums[i] = tempCollection[i];
                }
                //skipping element to be deleted
                else if( i > removeItemIndex){
                    musicAlbums[i - 1] = tempCollection[i];
                }
            }
            delete [] tempCollection;
            return true;
        }
    }
    return false;
}

int MAC::getMusicAlbums( MusicAlbum *&allMusicAlbums){
    allMusicAlbums = new MusicAlbum[ noOfMusicAlbums];
    for( int i = 0; i < noOfMusicAlbums; i++){
        allMusicAlbums[i] = musicAlbums[i];
    }
    return noOfMusicAlbums;
}
