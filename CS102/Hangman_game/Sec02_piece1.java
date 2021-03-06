import java.util.Scanner;

/**
 * Hangman Game Main Method = 1, Section 2. CS 102
 * @author Group C: Ege Hakan KARAAGAC, Ege Ozan Ozyedek, Ufuk Bombar, Ata Sonat Uzun, Taha Khurram, Muhammad Saboor.
 * @date 4/2/2018
 * @version 1.00
*/
public class Main
{
	/**
  	* Operates hangman game
  	* @param args String Array args
  	* @return void
  	*/
	public static void main( String[] args)
	{
		//declaring variables
		Scanner scan = new Scanner( System.in );
		String guess;
		int tmp;
		Hangman game;
		
		//initializing hangman game
		game = new Hangman();
		
		//this block runs while game is running
		do
		{
			//display hangman stats
			System.out.println( "* Used Letters: " + game.getUsedLetters() );
			System.out.println( "* Number of Incorrect Tries: " + game.getNumOfIncorrectTries() );
			System.out.println( "* Known So Far: " + game.getKnownSoFar() );
			System.out.println();
			
			//getting valid user input
			do
			{
				System.out.print( "Please enter a letter: " );
				guess = scan.nextLine();
			}
			while( guess.length() == 0 );
			
			//getting first character of user input, rest is ignored
			guess = guess.toLowerCase().charAt(0) + "";
			tmp = game.tryThis( guess );
			
			//check all cases and errors from tryThis method
			if ( tmp == -1 )
			{
				System.out.println( "The letter is not valid" );
			}
			else if ( tmp == -2 )
			{
				System.out.println( "The letter was already used" );
			}
			else if ( tmp > 0 )
			{
				System.out.println( tmp + "MATCHS!!!" );
			}
		}
		while ( !game.isGameOver() );
		
		//checking if the player has won or lost
		if( game.hasLost() )
		{
			System.out.println("You Lost!");
		}
		else
		{
			System.out.println("You Win!");
		}
	}
}