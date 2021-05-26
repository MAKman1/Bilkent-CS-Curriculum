package cardgame;

import java.util.ArrayList;

// Cardgame
// author:
// date:
public class CardGame
{
  
    // properties
    Cards             fullPack;
    ArrayList<Player> players;
    ScoreCard         scoreCard;
    Cards[]           cardsOnTable;
    int               roundNo;
    int               turnOfPlayer;
    
    // constructors
    public CardGame( Player p1, Player p2, Player p3, Player p4)
    {
      //Add players to the Arraylist
      this.players = new ArrayList();
      this.players.add(p1);
      this.players.add(p2);
      this.players.add(p3);
      this.players.add(p4);
      
      //Inintialize the sore card to number of players
      this.scoreCard = new ScoreCard(this.players.size());
      
      //Initilize the cards on table array to the number of rounds (ie: 52/ number of players)
      this.cardsOnTable = new Cards[(int) 52 / this.players.size()];
      
      //initialize the full stack
      this.fullPack = new Cards( true);
      
      //Initialize round and player
      this.roundNo = 0;
      this.turnOfPlayer = 0;
      
      this.fullPack.shuffle();
      //Initialize each Cards element in the Card on table array
      this.initializeCard();
      
      //Serve the cards to players hands
      this.serveCards();
    }
    
    // methods
    public void initializeCard()
    {
      for (int i = 0; i < (int) 52 / this.players.size(); i++)
      {
        this.cardsOnTable[i] = new Cards( false);
      }
    }
    //Serve the cards to players 
    public void serveCards()
    {
      for (int i = 0; i < 4; i++)
      {
        for (int j = 0; j < 13; j++)
        {
          players.get(i).add( this.fullPack.getTopCard());
        }
      }
    }
    
    public boolean playTurn( Player p, Card c)
    {
        if (this.isGameOver())
        {
          p.add( c);
          return false;
        }
        else if (!this.isTurnOf( p))
        {
          p.add( c);
          return false;
        }
        else
        {
          //return the card back
          this.cardsOnTable[roundNo].addTopCard( c);
          //If this wasn't the turn of last player, next player
          if( turnOfPlayer < this.players.size() - 1)
          {
            this.turnOfPlayer++;
          }
          else
          {
            //new round
            this.updateScores();
            this.roundNo++;
            this.turnOfPlayer = 0;
            
          }
          return true;
        }
    }
    
    public void updateScores()
    {
      //highest cards
      Card highest;
      highest = highestScore();
      //compare each with highest
      for (int i = 0; i < this.players.size(); i++)
      {
        if (this.cardsOnTable[this.roundNo].getCard(i).compareTo( highest) == 0)
        {
          //increment score of those who had the highest card
          this.scoreCard.update(i, 1);
        }
      }
    }
    
    //find the highest card value
    public Card highestScore()
    {
      
      Card highest;
      highest = new Card( 0);
      for (int i = 0; i < this.players.size(); i++)
      {
        //cmpare the cards to see if they're larger
        if (this.cardsOnTable[this.roundNo].getCard(i).compareTo( highest) < 0)
        {
          highest = this.cardsOnTable[this.roundNo].getCard(i);
        }
      }
      return highest;
    }
    
    //If player equals, it is his turn
    public boolean isTurnOf( Player p)
    {
        if( p.equals(players.get(turnOfPlayer)))
          return true;
        return false;
    }
    
    //See if round no is larger than 13 (ie: 52/ number of players)
    public boolean isGameOver()
    {
        if( this.roundNo > ((int) 52 / (this.players.size())) - 1)
          return true;
        return false;
    }
    
    public int getScore( int playerNumber)
    {
        return this.scoreCard.getScore(playerNumber);
    }
    
    public String getName( int playerNumber)
    {
        return this.players.get(playerNumber).getName();
    }
    
    public int getRoundNo()
    {
        return this.roundNo;
    }
    
    public int getTurnOfPlayerNo()
    {
        return this.turnOfPlayer;
    }
    
    //return the winners as of yet
    public Player[] getWinners()
    {
      int[] winners;
      Player[] playerReturn;
      
      //getting winners from the scoreCard
      winners = this.scoreCard.getWinners();
      //make a new player array
      playerReturn = new Player[winners.length];
      for( int i = 0; i < winners.length; i++)
      {
        //Add the player who was returned as inner
        playerReturn[i] = this.players.get(winners[i]);
      }
      return playerReturn;
      
    }
    
    public String showScoreCard()
    {
        return scoreCard.toString();
    }
    
}