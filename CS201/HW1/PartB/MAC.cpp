#include <iostream>
#include <string>
#include "MAC.h"
using namespace std;

MAC::MAC(){
    //assigning collections to null/ 0
    musicAlbums = NULL;
    noOfMusicAlbums = 0;
}
MAC::~MAC(){
    delete [] musicAlbums;
}
MAC::MAC( const MAC &macToCopy){
    //copying data
    noOfMusicAlbums = macToCopy.noOfMusicAlbums;
    if( noOfMusicAlbums == 0){
        musicAlbums = NULL;
    }
    else{
        //deep copying all elements
        musicAlbums = new MusicAlbum[ noOfMusicAlbums];
        for( int i = 0; i < noOfMusicAlbums; i++){
            musicAlbums[i] = macToCopy.musicAlbums[i];
        }
    }
}
void MAC::operator = (const MAC &right){
    //checking with right element to see if they're same to avoid unnecessary copying overhead
    if( &right != this){
        //freeing previous allocation
        delete [] musicAlbums;

        noOfMusicAlbums = right.noOfMusicAlbums;

        if( noOfMusicAlbums == 0){
            musicAlbums = NULL;
        }
        else{
            musicAlbums = new MusicAlbum[ noOfMusicAlbums];
            for( int i = 0; i < noOfMusicAlbums; i++){
                musicAlbums[i] = right.musicAlbums[i];
            }
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
        //checking is album already found
        for( int count = 0; count < noOfMusicAlbums - 1; count++){
            if( musicAlbums[count].getMusicAlbumArtist() == maArtist && musicAlbums[count].getMusicAlbumTitle() == maTitle){
                //breaking if found
                return false;
            }
        }
        //if no same album found
        noOfMusicAlbums++;
        MusicAlbum *tempCollection = musicAlbums;

        musicAlbums = new MusicAlbum[ noOfMusicAlbums];
        //deep copying data
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
    int removeItemIndex = -1;
    //finding index of element
    if( noOfMusicAlbums > 0){
        for( int count = 0; count < noOfMusicAlbums; count++){
            if( musicAlbums[count].getMusicAlbumArtist() == maArtist && musicAlbums[count].getMusicAlbumTitle() == maTitle){
                removeItemIndex = count;
            }
        }
        //checking if element found
        if( removeItemIndex >= 0){
            //reducing collection size
            noOfMusicAlbums--;
            MusicAlbum *tempCollection = musicAlbums;
            musicAlbums = new MusicAlbum[ noOfMusicAlbums];\
            //keep going on for all elements
            for ( int i = 0; i <= noOfMusicAlbums; i++){
                if( i < removeItemIndex){
                    musicAlbums[i] = tempCollection[i];
                }
                //skipping the element at index i
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
bool MAC::addSong(const string maArtist, const string maTitle,
             const string sName, const int sMins,
             const int sSecs){
    int addItemIndex = -1;
    if( noOfMusicAlbums > 0){
        //finding album
        for( int count = 0; count < noOfMusicAlbums; count++){
            if( musicAlbums[count].getMusicAlbumArtist() == maArtist && musicAlbums[count].getMusicAlbumTitle() == maTitle){
                addItemIndex = count;
            }
        }
        //checking if album found
        if( addItemIndex >= 0){
            return musicAlbums[ addItemIndex].addSong( sName, sMins, sSecs);
        }
    }
    return false;
}
bool MAC::removeSongs(const string maArtist,
                 const string maTitle){
     //finding album
    int removeItemIndex = -1;
    if( noOfMusicAlbums > 0){
        for( int count = 0; count < noOfMusicAlbums; count++){
            if( musicAlbums[count].getMusicAlbumArtist() == maArtist && musicAlbums[count].getMusicAlbumTitle() == maTitle){
                removeItemIndex = count;
            }
        }
        //checking if album found
        if( removeItemIndex >= 0){
            return musicAlbums[ removeItemIndex].removeSongs();
        }
    }
    return false;
}
void MAC::calculateAvgMusicAlbumLength( int &minute, int &second){
    minute = 0;
    second = 0;
    if( noOfMusicAlbums > 0){
        int totalSeconds = 0;
        for( int i = 0; i < noOfMusicAlbums; i++){
            int tempSeconds;
            int tempMinutes;

            musicAlbums[ i].calculateMusicAlbumLength( tempMinutes, tempSeconds);

            //adding the seconds/ minutes to total album run time
            totalSeconds = totalSeconds + tempSeconds + (tempMinutes * 60);
        }

        //finding average of seconds
        totalSeconds = totalSeconds / noOfMusicAlbums;

        //converting total seconds to minutes and seconds
        second = totalSeconds % 60;
        minute = (totalSeconds - second) / 60;
    }
}
