import java.util.Scanner;
import cardgame.*;

// CardGameTest
// author:
// date:
public class CardGameTest
{
    public static void main( String[] args)
    {
        Scanner scan = new Scanner( System.in);
        
        System.out.println( "Start of CardGameTest\n");
        
        // CONSTANTS
        
        // VARIABLES
        Card       c;
        Cards      cards;
        ScoreCard  scores;
        Player     p1;
        Player     p2;
        Player     p3;
        Player     p4;
        CardGame   game;
        
        // PROGRAM CODE
        
        // test Card class
        c = new Card( 1);
        System.out.println( c);
        System.out.println();
        
        // test Cards class
        cards = new Cards( true);
        cards.addTopCard( c);
        
        // test ScoreCard class
        scores = new ScoreCard( 4);
        scores.update( 3, 1);
        scores.update( 1, 2);
        System.out.println( "\n" + scores );
        
        // test Player class
        p1 = new Player("Arham");
        p1.add( c);
        System.out.println(p1.getName());
        System.out.println(p1.playCard());

        
        // test CardGame class too?\
        p2 = new Player("Daddy");
        p3 = new Player("Khan");
        p4 = new Player("Escobar");
        game = new CardGame(p1, p2, p3, p4);
        
        Card testCard;
        
        System.out.println( game.getName(1));
        testCard = p1.playCard();
        System.out.println(game.playTurn(p1, testCard));
        
        
        // Once you have all the bits working, complete the MyCardGame program
        // that provides a menu allowing any of the players to play their card,
        // an option to see the score card, and one to quit the game at any time.
        // When the game is over it should print out the winners.
        
        System.out.println( "\nEnd of CardGameTest\n" );
    }
    
} // end of class CardGameTest
