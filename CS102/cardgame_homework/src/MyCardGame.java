import java.util.Scanner;
import cardgame.*;

// MyCardGame - provides a menu allowing any of the players to play their card,
//              an option to see the score card, and one to quit the game at any time.
//              When the game is over it dislays the winners.
// author:
// date:
public class MyCardGame
{
    public static void main( String[] args)
    {
        Scanner scan = new Scanner( System.in);
        
        System.out.println( "Start of MyCardGame\n");
        
        // CONSTANTS
        final int MENU_EXIT = 0;
        final int MENU_PLAY_P1 = 1;
        final int MENU_PLAY_P2 = 2;
        final int MENU_PLAY_P3 = 3;
        final int MENU_PLAY_P4 = 4;
        final int MENU_SCORES  = 5;
        final int INITIALIZE = 100;
        
        // VARIABLES
        Player     p1, p2, p3, p4;
        boolean    isNotOver;
        CardGame   game;
        int        selection;
        Player[] winners;
        
        // PROGRAM CODE

        // create players...
        p1 = new Player( "Dr.Java");
        p2 = new Player( "Eclipse");
        p3 = new Player( "JetBeans");
        p4 = new Player( "IntelliJ");
        
        isNotOver = true;
        
        // create game with the 4 players...
        game = new CardGame( p1, p2, p3, p4);
        
        // display menu, get and process selection, until exit
        selection = INITIALIZE;
        do 
        {
          //Seeing if game is over yet
          if (game.isGameOver())
                isNotOver = false;
          else
          {
            // display menu
            System.out.println();
            System.out.println( "MyCardGame   Round: " + (game.getRoundNo() + 1) 
                                 + "\t TurnOfPlayer: " + (game.getTurnOfPlayerNo() + 1) );
            System.out.println();
            System.out.println( MENU_PLAY_P1 + " - Player " + MENU_PLAY_P1 + " plays" );
            System.out.println( MENU_PLAY_P2 + " - Player " + MENU_PLAY_P2 + " plays" );
            System.out.println( MENU_PLAY_P3 + " - Player " + MENU_PLAY_P3 + " plays" );
            System.out.println( MENU_PLAY_P4 + " - Player " + MENU_PLAY_P4 + " plays" );
            System.out.println( MENU_SCORES  + " - Show scores" );
            
            // ask for and get selection
            System.out.println();
            System.out.println( "Selection (" + MENU_EXIT + " to exit): ");
            selection = scan.nextInt();
            
            // process selection
            
            if ( selection == MENU_PLAY_P1 )
              play( p1, game);
            
            else if ( selection == MENU_PLAY_P2 )
              play( p2, game);
            
            else if ( selection == MENU_PLAY_P3 )
              play( p3, game);
            
            else if ( selection == MENU_PLAY_P4 )
              play( p4, game);
            
            else if ( selection == MENU_SCORES )
              System.out.println( game.showScoreCard() );
            
            else if ( selection != MENU_EXIT)
              System.out.println( "Invalid selection! \n" );
          }
            
            
        } while ( selection != MENU_EXIT && isNotOver == true);

        // display winners...
        // ToDo ~ game.isGameOver(); ? game.getWinners(); 
        System.out.println("Game is over");
        System.out.println("The Winners are:");
        
        winners = game.getWinners();
        for (Player temp: winners)
        {
          System.out.println(temp.getName());
        }
        
        System.out.println( "\nEnd of MyCardGame\n" );   
    }
    // get the card, c, that player p wants to play
    // pass c to the game, see if it accepted c from p
    // if game didn't accept the card, give c back to the player! 
    // return accepted.
    private static boolean play( Player p, CardGame game)
    {
        Card       c;
        boolean    accepted;
        
        //get card
        c = p.playCard();
        //if the card wasn't returned
        if( c == null)
          return false;
        //If the game play returned false
        accepted = game.playTurn(p, c);
        if(!accepted)
        {
          p.add( c);
        }
        return accepted;
    }
    
} // end class MyCardGame
