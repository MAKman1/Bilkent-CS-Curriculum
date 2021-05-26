package cardgame;

// ScoreCard - Maintains one integer score per player, for any number of players
//             Caution: invalid playernumbers result in run-time exception!
// author:
// date:
public class ScoreCard
{
    // properties
    int[] scores;
    
    // constructors
    public ScoreCard( int noOfPlayers)
    {
        scores = new int[noOfPlayers];
        
        // init all scores to zero
        for ( int i = 0; i < scores.length; i++)
            scores[i] = 0;
    }
    
    // methods
    public int getScore( int playerNo)
    {
        return scores[ playerNo];
    }
    
    public void update( int playerNo, int amount)
    {
        scores[playerNo] += amount;
    }
    
    public String toString()
    {
        String s;
        s = "\n"
            + "_____________\n"
            + "\nPlayer\tScore\n"
            + "_____________\n";
        
        for ( int playerNo = 0; playerNo < scores.length; playerNo++)
        {
            s = s + (playerNo + 1) + "\t" + scores[playerNo] + "\n";
        }
        
        s += "_____________\n";
        return s;
    }
    
    public int[] getWinners()
    {
      int highScore;
      int[] winners;
      int valid;
      int numberOfWinners;
      
      highScore = 0;
      valid = 0;
      numberOfWinners = 0;
      //Calculating what the highest score in the array is
      for ( int playerNo = 0; playerNo < scores.length; playerNo++)
      {
        if( this.scores[playerNo] > highScore)
        {
          highScore = this.scores[playerNo];
        }
      }
      //Calculating the number of players who have that highest score
      for( int playerNo = 0; playerNo < scores.length; playerNo++)
      {
        if( this.scores[playerNo] == highScore)
        {
          numberOfWinners++;
        }
      }
      //initializing winner array to the number of people calculated earlier
      winners = new int[numberOfWinners];
      
      //Adding the people who threw the highest card to the winner array
      for( int playerNo = 0; playerNo < scores.length; playerNo++)
      {
        if( this.scores[playerNo] == highScore)
        {
          winners[valid] = playerNo;
          valid++;
        } 
      }
      return winners;
    }
    
} // end class ScoreCard
