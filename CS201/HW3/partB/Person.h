#ifndef __PERSON_H
#define __PERSON_H
#include "Phone.h"
#include <string>
using namespace std;

class Person{
public:
    Person( const string name = "");
    ~Person();
    Person( const Person &personToCopy);
    void operator = ( const Person &right );
    string getName();
    bool addPhone( const int areaCode, const int number );
    bool removePhone( const int areaCode, const int number );
    void displayPhoneNumbers();
    int phoneNumberCount();
    void getAreaCodeCount( const int areaCode);
private:

    struct PhoneNode {
        Phone p;
        PhoneNode* next;
    };
    PhoneNode *head;
    string name;
    PhoneNode* findPhone( const int areaCode, const int number );
};
#endif // __PERSON_H
