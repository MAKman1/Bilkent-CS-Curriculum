#include <string>
#include <algorithm>
#include <iostream>
#include "PhoneBook.h"
using namespace std;

PhoneBook::PhoneBook(){
    head = NULL;
    this->numberOfPeople = 0;
}
PhoneBook::~PhoneBook(){
    Node* delNode = head;
    while( delNode != NULL){
        head = head->next;
        delete delNode;
        delNode = head;
    }
    head = NULL;
}
PhoneBook::PhoneBook( const PhoneBook& systemToCopy ){
    numberOfPeople = systemToCopy.numberOfPeople;
    if (systemToCopy.head == NULL)
        head = NULL;
    else {
        // copy first node
        head = new Node;
        head->t = systemToCopy.head->t;
        // copy rest of list
        Node *newPtr = head;  // new list ptr

        for (Node *origPtr = systemToCopy.head->next; origPtr != NULL; origPtr = origPtr->next){
            newPtr->next = new Node;
            newPtr = newPtr->next;
            newPtr->t = origPtr->t;
        }
        newPtr->next = NULL;
    }

}
void PhoneBook::operator=( const PhoneBook &right ){
    if( &right != this){
        //deleting previous nodes
        Node* delNode = head;
        while( delNode != NULL){
            head = head->next;
            delete delNode;
            delNode = head;
        }
        head = NULL;
        //adding new nodes

        numberOfPeople = right.numberOfPeople;
        if (right.head == NULL){
            head = NULL;
        }
        else {
            // copy first node
            head = new Node;
            head->t = right.head->t;
            // copy rest of list
            Node *newPtr = head;  // new list ptr


            for (Node *origPtr = right.head->next; origPtr != NULL; origPtr = origPtr->next){
                newPtr->next = new Node;
                newPtr = newPtr->next;
                newPtr->t = origPtr->t;
            }
            newPtr->next = NULL;
        }
    }
}
bool PhoneBook::addPerson( string name ){
    Node* temp = findPerson( name);
    if( temp == NULL){
        temp = head;
        head = new Node;
        head->t = Person( name);
        head->next = temp;


        return true;
    }
    else{
        cout << "Person already exists" << endl;
        return false;
    }
}
bool PhoneBook::removePerson( string name ){
    Node* temp = findPerson( name);
    if( temp != NULL){
        if( temp == head){
            head = temp->next;
        }
        else{
            Node* prev = head;
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
        cout << "Person not found" << endl;
        return false;
    }
}
bool PhoneBook::addPhone( string personName, int areaCode, int number ){
    Node* temp = findPerson( personName);
    if( temp != NULL){
        return temp->t.addPhone( areaCode, number);
    }
    else{
        cout << "Person not found" << endl;
        return false;
    }
}
bool PhoneBook::removePhone( string personName, int areaCode, int number ){
    Node* temp = findPerson( personName);
    if( temp != NULL){
        return temp->t.removePhone( areaCode, number);
    }
    else{
        cout << "Person not found" << endl;
        return false;
    }
}
void PhoneBook::displayPerson( string name ){
    Node* temp = findPerson( name);
    if( temp != NULL){
        cout << "Person " << temp->t.getName() << endl;
        temp->t.displayPhoneNumbers();
    }
    else
        cout << "--EMPTY--" << endl;
}
void PhoneBook::displayAreaCode( int areaCode ){
    cout << "Area " << areaCode << endl;
    Node* temp =  head;
    while( temp != NULL){
        temp->t.getAreaCodeCount( areaCode);

        temp = temp->next;
    }
}
void PhoneBook::displayPeople(){
    Node* temp =  head;
    while( temp != NULL){
        cout << "Person " << temp->t.getName() << ", ";
        cout << temp->t.phoneNumberCount() << endl;

        temp = temp->next;
    }
}
PhoneBook::Node* PhoneBook::findPerson( string name ){
    if( head != NULL){
        Node* temp = head;
        while( temp != NULL){
            if( toLowerCase( temp->t.getName()) == toLowerCase( name))
                return temp;
            temp = temp->next;
        }
        return NULL;
    }
    else{
        return NULL;
    }
}

string PhoneBook::toLowerCase( string input){
    transform(input.begin(), input.end(), input.begin(), ::tolower);
    //cout << input << endl;
    return input;
}
