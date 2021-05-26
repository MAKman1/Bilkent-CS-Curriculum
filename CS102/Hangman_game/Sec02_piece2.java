/*
* Constructor of HangMan class
* Group B - Piece 2 (CONSTRUCTOR)
* Group Members: 
	* TALHA BOZKUS
	* FATIH KARAHAN
	* OGUZ SATOGLU
	* EGE TURKER
	* ARDA BUGLAGIL
	* ARDA KIZILKAYA
*/

  public HangMan()
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