/**
 * The actual Hangman class, but without the constructor, the chooseSecretWord method, and the tryThis method, being implemented.
 * @author Umur Gogebakan, Omer Faruk Kurklu, Arda Gultekin, Gokberk Boz, Ogulcan Pirim, Mahir Efe Macit
 * @version 2018-02-06
 */
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
    public Hangman () {
        
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
        return numberOfIncorrectTries >= maxAllowedIncorrectTries;
    }
    
    // chooseSecretWord and tryThis methods are empty and commented.
    // should be uncommented and filled.
//    public void chooseSecretWord() {
//        
//    }
//    
//    public int tryThis() {
//        
//    }
}