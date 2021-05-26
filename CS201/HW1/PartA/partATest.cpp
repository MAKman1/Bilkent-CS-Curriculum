#include <string>
#include <iostream>
#include "SimpleMusicAlbum.h"
#include "SimpleMAC.h"
using namespace std;


void displayAllMusicAlbums(MAC mac){

    MusicAlbum *allMusicAlbums;
    int noOfMusicAlbums = mac.getMusicAlbums( allMusicAlbums);

    cout <<"No of music albums: "<< noOfMusicAlbums << endl;
    for (int i = 0; i < noOfMusicAlbums; i++){
        cout << allMusicAlbums[i].getMusicAlbumArtist() << ", "
        << allMusicAlbums[i].getMusicAlbumTitle() << " ("
        << allMusicAlbums[i].getMusicAlbumYear() << ")"
        << endl;
    }
    if ( allMusicAlbums != NULL)
        delete [] allMusicAlbums;
}
int main(){

    MAC m;

    m.addMusicAlbum("John Coltrane", "My Favorite Things", 1961);
    if (m.addMusicAlbum("John Coltrane", "A Love Supreme", 1965))
        cout << "Successful insertion of John Coltrane, " << "A Love Supreme (1965)" << endl;
    else
        cout << "Unsuccessful insertion of John Coltrane, " << "A Love Supreme (1965)" << endl;
    m.addMusicAlbum("Jethro Tull", "Thick As A Brick", 1972);
    m.addMusicAlbum("Mike Oldfield", "Tubular Bells", 1973);
    m.addMusicAlbum("Pink Floyd", "The Dark Side of the Moon", 1973);

    displayAllMusicAlbums( m);



    if (m.removeMusicAlbum("John Coltrane", "Giant Steps"))
        cout << "Successful deletion of John Coltrane, " << "Giant Steps" << endl;
    else
        cout << "Unsuccessful deletion of John Coltrane, " << "Giant Steps" << endl;
return 0;
}
