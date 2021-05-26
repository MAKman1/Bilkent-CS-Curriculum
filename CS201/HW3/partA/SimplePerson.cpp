#include <string>
#include "SimplePerson.h"
using namespace std;

Person::Person( const string name) {
    this->name = name;
}
Person::~Person() {
}
Person::Person( const Person &personToCopy ) {
    name = personToCopy.name;
}
void Person::operator = ( const Person &right){
    if( this != &right){
        name = right.name;
    }
}
string Person::getName() {
    return name;
}
