#include <string>
#include <iostream>
#include <algorithm>
#include "SimplePhoneBook.h"
using namespace std;

PhoneBook::PhoneBook(){
    numberOfPeople = 0;
    head = NULL;
}
PhoneBook::~PhoneBook(){
    while( head != NULL){
        PersonNode* temp = head;
        head = head->next;
        delete temp;
    }
}
PhoneBook::PhoneBook ( const PhoneBook &phoneBookToCopy){
    numberOfPeople = phoneBookToCopy.numberOfPeople;
    if( numberOfPeople > 0){
        head = new PersonNode;
        head->t = phoneBookToCopy.head->t;
        PersonNode* temp = phoneBookToCopy.head->next;
        PersonNode* currNode = head;
        while( temp != NULL){
            currNode->next = new PersonNode;
            currNode->next->t = temp->t;
            temp = temp->next;
            currNode = currNode->next;
        }
    }
    else
        head = NULL;
}
void PhoneBook::operator = ( const PhoneBook &right){
    if( &right != this){
        //deleting previous nodes
        PersonNode* delNode = head;
        while( delNode != NULL){
            head = head->next;
            delete delNode;
            delNode = head;
        }
        head = NULL;
        //copying data
        numberOfPeople = right.numberOfPeople;
        if( numberOfPeople > 0){
            head = new PersonNode;
            head->t = right.head->t;
            PersonNode* temp = right.head->next;
            PersonNode* currNode = head;
            while( temp != NULL){
                currNode->next = new PersonNode;
                currNode->next->t = temp->t;
                temp = temp->next;
                currNode = currNode->next;
            }
        }
        else
            head = NULL;
    }
}
bool PhoneBook::addPerson( const string name){
    if( numberOfPeople > 0){
        PersonNode* temp = findPerson( name);
        if( temp == NULL){
            temp = head;
            head = new PersonNode;
            head->t = Person( name);
            head->next = temp;

            numberOfPeople++;
            return true;
        }
        else{
            return false;
        }
    }
    else{
        head = new PersonNode;
        head->t = Person( name);
        head->next = NULL;
        numberOfPeople++;
        return true;
    }
}
bool PhoneBook::removePerson( const string name){
    PersonNode* temp = findPerson( name);
    if( temp != NULL){
        if( temp == head){
            head = temp->next;
        }
        else{
            PersonNode* prev = head;
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
        return false;
    }
}
void PhoneBook::displayPeople(){
    if( numberOfPeople > 0){
        PersonNode* temp = head;
        while( temp != NULL){
            cout << "Person " << temp->t.getName() << endl;
            temp = temp->next;
        }
    }
    else{
        cout << "--EMPTY--" <<endl;
    }
}

PhoneBook::PersonNode* PhoneBook::findPerson( string name){
    if( numberOfPeople > 0){
        transform(name.begin(), name.end(), name.begin(), ::tolower);
        string currentName = "";

        PersonNode* temp = head;
        while( temp != NULL){
            currentName = temp->t.getName();
            transform(currentName.begin(), currentName.end(), currentName.begin(), ::tolower);
            if( currentName == name)
                return temp;
            temp = temp->next;
        }
        return NULL;
    }
    else{
        return NULL;
    }
}



