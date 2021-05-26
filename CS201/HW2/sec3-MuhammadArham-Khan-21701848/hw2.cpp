#include <iostream>
#include <ctime>
using namespace std;


int main(){

    double duration;
    clock_t startTime;

    //Recursive algorithm________________________________________________________________
    for( int i = 1; i < 56; i++){
        //higher accuracy needed
        if( i < 15){
            startTime = clock();

            cout << "input: " << i;
            for( int a = 0; a < 1000000; a++){
                recursiveFib( i) ;
            }

            duration = (1000000 * (double( clock() - startTime) / CLOCKS_PER_SEC)) / 1000000;
            cout << " ~ Time taken:   " << duration << "  microseconds." << endl;
        }
        //medium accuracy
        else if( i < 37){
            startTime = clock();

            cout << "input: " << i;
            for( int a = 0; a < 1000; a++){
                recursiveFib( i) ;
            }

            duration = (1000 * (double( clock() - startTime) / CLOCKS_PER_SEC)) / 1000;
            cout << " ~ Time taken:   " << duration << "  milliseconds." << endl;
        }
        //original time
        else{
            startTime = clock();

            cout << "input: " << i;
            cout << " ~ output: ";
            recursiveFib( i) ;

            duration = (1000 * (double( clock() - startTime) / CLOCKS_PER_SEC));
            cout << " ~ Time taken:   " << duration << "  milliseconds." << endl;
        }
    }

    //Iterative algorithm________________________________________________________________
    //to start from one and increment accordingly
    int input = 1;
    for( int i = 0; i < 21; i++){
        //to improve accuracy for lower values
        if( i < 1){
            startTime = clock();
            cout << "input: " << input;

            //averaging values
            for( int a = 0; a < 1000000; a++){
                iterativeFib( input) ;
            }

            duration = (1000000 * (double( clock() - startTime) / CLOCKS_PER_SEC)) / 1000000;
            cout << " ~ Time taken:   " << duration << "  microseconds." << endl;
            if( input == 1)
                input = 50000000;
            else
                input += 50000000;
        }
        else{
            startTime = clock();

            cout << "input: " << input;
            cout << " ~ output: ";
            iterativeFib( input) ;

            duration = (1000 * (double( clock() - startTime) / CLOCKS_PER_SEC));
            cout << " ~ Time taken:   " << duration << "  milliseconds." << endl;
            input += 50000000;
        }
    }
}
