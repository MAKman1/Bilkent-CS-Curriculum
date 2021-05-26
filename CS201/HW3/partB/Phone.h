#ifndef __PHONE_H
#define __PHONE_H
using namespace std;

class Phone{
public:
    Phone();
    Phone( const int areaCode, const int number);
    int getAreaCode();
    int getNumber();

private:
    int areaCode;
    int number;
};
#endif // __PHONE_H
