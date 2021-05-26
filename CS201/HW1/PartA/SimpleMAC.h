#ifndef _SIMPLE_MAC_H
#define _SIMPLE_MAC_H

#include <string>
using namespace std;
#include "SimpleMusicAlbum.h"

class MAC {
public:
    MAC();

    ~MAC();

    MAC( const MAC &macToCopy);

    void operator = ( const MAC &right);

    bool addMusicAlbum( const string maArtist,
                        const string maTitle,
                        const int maYear);

    bool removeMusicAlbum( const string maArtist,
                           const string maTitle);

    int getMusicAlbums( MusicAlbum *&allMusicAlbums);

private:
    MusicAlbum *musicAlbums;
    int noOfMusicAlbums;
};

#endif // _SIMPLE_MAC_H
