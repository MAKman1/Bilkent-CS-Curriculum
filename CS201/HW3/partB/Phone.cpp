#include "Phone.h"
using namespace std;

Phone::Phone(){
    areaCode = 0;
    number = 0;
}
Phone::Phone( const int areaCode, const int number){
    this->areaCode = areaCode;
    this->number = number;
}
int Phone::getAreaCode(){
    return areaCode;
}
int Phone::getNumber(){
    return number;
}
