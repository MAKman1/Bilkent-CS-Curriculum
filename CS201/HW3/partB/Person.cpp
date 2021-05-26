#include <iostream>
#include "Person.h"
using namespace std;

Person::Person( string name){
    head = NULL;
    this->name = name;
}
Person::~Person(){
    PhoneNode* delNode = head;
    while( delNode != NULL){
        head = head->next;
        delete delNode;
        delNode = head;
    }
    head = NULL;
}
Person::Person( const Person &personToCopy){
    name = personToCopy.name;
    if( personToCopy.head != NULL){
        head = new PhoneNode;
        head->p = personToCopy.head->p;
        PhoneNode* temp = personToCopy.head->next;
        PhoneNode* currNode = head;
        while( temp != NULL){
            currNode->next = new PhoneNode;
            currNode->next->p = temp->p;
            temp = temp->next;
            currNode = currNode->next;
        }
        currNode->next =NULL;
    }
    else
        head = NULL;
}
void Person::operator = ( const Person &right ){
    if( &right != this){
        //deleting previous nodes
        PhoneNode* delNode = head;
        while( delNode != NULL){
            head = head->next;
            delete delNode;
            delNode = head;
        }
        head = NULL;

        //copying new data
        name = right.name;
        if( right.head != NULL){
            head = new PhoneNode;
            head->p = right.head->p;
            PhoneNode* temp = right.head->next;
            PhoneNode* currNode = head;
            while( temp != NULL){
                currNode->next = new PhoneNode;
                currNode->next->p = temp->p;
                temp = temp->next;
                currNode = currNode->next;
            }
            currNode->next =NULL;
        }
        else
            head = NULL;
    }
}
string Person::getName(){
    return name;
}
bool Person::addPhone( const int areaCode, const int number ){
    PhoneNode* temp = findPhone( areaCode, number);
    if( temp == NULL){
        temp = head;
        head = new PhoneNode;
        head->p = Phone( areaCode, number);
        head->next = temp;


        return true;
    }
    else{
        cout << "phone number already exists" << endl;
        return false;
    }
}
bool Person::removePhone( const int areaCode, const int number ){
    PhoneNode* temp = findPhone( areaCode, number);
    if( temp != NULL){
        if( temp == head){
            head = temp->next;
        }
        else{
            PhoneNode* prev = head;
            while( prev->next != temp){
                prev = prev->next;
            }
            prev->next = temp->next;
        }
        delete temp;
        temp = NULL;
        return true;
    }
    else{
        cout << "phone number not found" << endl;
        return false;
    }
}
void Person::displayPhoneNumbers(){
    if( head != NULL){
        PhoneNode* temp = head;
        while( temp != NULL){
            cout << "Phone number: Area " << temp->p.getAreaCode() << ", " << temp->p.getNumber() << endl;
            temp = temp->next;
        }
    }
    else{
        cout << "--EMPTY--" <<endl;
    }
}
int Person::phoneNumberCount(){
    int count = 0;
    PhoneNode* temp = head;
    while( temp != NULL){
        count++;
        temp = temp->next;
    }
    return count;
}
void Person::getAreaCodeCount( const int areaCode){
    int count = 0;
    PhoneNode* temp = head;
        while( temp != NULL){
            if( temp->p.getAreaCode() == areaCode){
                if( count == 0){
                    cout << "Person " << name << endl;
                    cout << "Phone number: Area " << temp->p.getAreaCode() << ", " << temp->p.getNumber() << endl;
                }
                else{
                    cout << "Phone number: Area " << temp->p.getAreaCode() << ", " << temp->p.getNumber() << endl;
                }
                count++;
            }
            temp = temp->next;
        }
}
Person::PhoneNode* Person::findPhone( const int areaCode, const int number ){
    if( head != NULL){
        PhoneNode* temp = head;
        while( temp != NULL){
            if( temp->p.getAreaCode() == areaCode && temp->p.getNumber() == number)
                return temp;
            temp = temp->next;
        }
        return NULL;
    }
    else{
        return NULL;
    }
}
