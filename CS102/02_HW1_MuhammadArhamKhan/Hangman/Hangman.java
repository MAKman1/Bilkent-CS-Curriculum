/**
 * The actual Hangman class, but without the constructor, the chooseSecretWord method, and the tryThis method, being implemented.
 * @author Umur Gogebakan, Omer Faruk Kurklu, Arda Gultekin, Gokberk Boz, Ogulcan Pirim, Mahir Efe Macit
 */

import java.util.Scanner;
import java.util.ArrayList;
import java.util.Collections;
import java.io.File;
import java.io.FileWriter;
import java.io.FileReader;
import java.io.PrintWriter;
import java.io.IOException;
import java.io.LineNumberReader;

public class Hangman {
    // Properties
    private StringBuffer secretWord;
    private StringBuffer allLetters;
    private StringBuffer usedLetters;
    private StringBuffer knownSoFar;
    private int numberOfIncorrectTries;
    private int maxAllowedIncorrectTries;
    // Constructors
    /**
     * Class Constructor
     * No parameters
     * Empty body (should be filled)
     */
    public Hangman()
    {
      secretWord = new StringBuffer( chooseSecretWord() );
      allLetters = new StringBuffer("abcdefghijklmnopqrstuvwxyz");
      usedLetters = new StringBuffer("");
      knownSoFar = new StringBuffer("");
      numberOfIncorrectTries = 0;
      maxAllowedIncorrectTries = 6;
      
      // hide the secret word by stars
      for ( int i = 0 ; i < secretWord.length() ; i++ )
      {
        knownSoFar.append("*");  
      }
    }
    // Methods
    /**
     * This method is used to get all letters that can be used. 
     * @return all letters that can be used to predict the secret word.
     */
    public String getAllLetters() {
        return allLetters.toString();
    }
    
    /**
     * This method is used to get already tried letters.
     * @return letters that have been tried by the user.
     */
    public String getUsedLetters() {
        return usedLetters.toString();
    }
    
    /**
     * This method is used to get the number of incorrect tries.
     * @return the number of incorrect tries that user has made.
     */
    public int getNumOfIncorrectTries() {
        return numberOfIncorrectTries;
    }
    
    /**
     * This method is used to get maximum allowed number of incorrect tries.
     * @return the integer value of maximum allowed incorrect tries.
     */
    public int getMaxAllowedIncorrectTries() {
        return maxAllowedIncorrectTries;
    }
    
    /**
     * This method is used to get known part of the secret word.
     * @return the known part of the secret word.
     */
    public String getKnownSoFar() {
        return knownSoFar.toString();
    }
    
    /**
     * This method is used to determine whether the game is over or not.
     * @return true if the game is over.
     */
    public boolean isGameOver() {
        return ( knownSoFar.toString().equals(secretWord.toString() ) ) || (
                 numberOfIncorrectTries >= maxAllowedIncorrectTries );
    }
    
    /**
     * This method is used to determine whether the user has lost or not.
     * @return true if the user has lost the game.
     */
    public boolean hasLost() {
      if( numberOfIncorrectTries >= maxAllowedIncorrectTries)
        return true;
      else
        return false;
        
    }
    

   
    //method using text files

   /**
    * Chooses a word from a dictionary text file in the source directory
    * @return StringBuffer the randomly chosen word
    */
   
   private StringBuffer chooseSecretWord ()
   {
      //constants
      final String DICTIONARY_NAME = "words.txt";

      //variables
      StringBuffer resultWord = null;

      //code
      try {
        //variables
        String selectedWord;
        File myFile;
        Scanner scan;
        //use LineNumberReader to find the length of the file
        LineNumberReader lineNumberReader;
        
        //initialize
        myFile = new File(DICTIONARY_NAME);
        scan = new Scanner ( myFile );
        lineNumberReader = new LineNumberReader(new FileReader ( myFile ) );
        
        //jump to the bottom of the file, and find how many lines it is
        lineNumberReader.skip(Long.MAX_VALUE);
        int lines = lineNumberReader.getLineNumber();
        lineNumberReader.close();
        
        int randomLine = (int) (lines * Math.random());
        
        selectedWord = "";
        //find the randomly selected word
        for ( int i = 0; i < randomLine; i++)
        {
          selectedWord = scan.nextLine();
        }

        resultWord = new StringBuffer( selectedWord );

      } catch (Exception e) {

         System.out.println("Exception occured: " + e.getMessage());

      }
      return resultWord;
   }
   
   /**
    * This method returns the number of times the specified letter occurs in the chosen word.
    * @author Hanzallah Azim Burney, Abdul Hamid Dabboussi, Khasmamad, Muhammad Raza, Gledis, Supermurat
    * @param The character to be checked in the word.
    * @return The number of times the letter occurs or else the corresponding error code.
    */
   public int tryThis(char newLetter)
   {
     String letter = Character.toString(newLetter);
     int count;
     count = 0;
     if (this.usedLetters.indexOf(letter) != -1)
     {
       return -2;
     }
     else if (isGameOver())
     {
       return -3;
     }
     else if(this.secretWord.indexOf(letter) != -1 )
     {
       for (int i = 0; i < this.secretWord.length(); i++)
       {
         if (this.secretWord.toString().toLowerCase().substring(i, i + 1).equals(letter))
         {
           this.knownSoFar.replace(i,i+1,letter);
           count++;
         }
       }
       usedLetters.append(letter);
       return count;
     }
     else
     {
       numberOfIncorrectTries++;
       return -1;
     }
   }
}