/**
 * _chooseSecretWord method_
 * @author_Sarah Javaid, Ýlknur Baþ, Ahmet Kaan Kasap, Burak Yeni_
 * @version_4.02.18
 */

import java.util.Scanner;
import java.util.ArrayList;
import java.util.Collections;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.IOException;

public class Hangman
{
  
  public static Scanner readFile(String fileName) throws IOException {
    File myfile = new File(fileName);
    Scanner fileScanner = new Scanner(myfile);
    return fileScanner;
  }
  
  public String chooseScreetWord() throws IOException 
  {
    int value;
    String secretWord;
    
    String fileNameRead = "listOfWords.txt";
    Scanner filekb = readFile(fileNameRead);
    
    String[] words = new String [100];
    int x = 0;
    
    while( filekb.hasNextLine() )
    {
      String line = filekb.nextLine();
      Scanner lineSperator = new Scanner(line);
      words[x++] = lineSperator.next();
    }
    
    secretWord = words[(int)(Math.random()*(x+1))];
    
    return secretWord;
  } 
}