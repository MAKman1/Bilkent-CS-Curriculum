// Group Members:
// 1) Amirhossein Maghsoudi
// 2) Sayed Abdullah Qutb
// 3) Mohamad Fakhouri
// 4) Muhammad Arham Khan
// 5) Esra Nur Deniz
// 6) Ahmet Berk Eren

// CODE

//method using array

/**
    * Chooses a word from random from a String array
    * @param words word list passed from the constructor
    * @return StringBuffer the randomly chosen word
    */
   private StringBuffer chooseSecretWord (String[] words){

      //variables
      int randomIndex;
      String selectedWord;

      //code
      randomIndex = (int) (words.length * Math.random() );
      selectedWord = words[randomIndex];

      return new StringBuffer( selectedWord );
   }

//method using text files

   /**
    * Chooses a word from a dictionary text file in the source directory
    * @return StringBuffer the randomly chosen word
    */
   private StringBuffer chooseSecretWord (){
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
         for ( int i = 0; i < randomLine; i++){
            selectedWord = scan.nextLine();
         }

         resultWord = new StringBuffer( selectedWord );

      } catch (Exception e) {

         System.out.println("Exception occured: " + e.getMessage());

      }
      return resultWord;
   }
