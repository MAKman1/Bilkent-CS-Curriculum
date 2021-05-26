package cardgame;

// Cards - Maintains a collection of zero or more playing cards.
//         Provides facilities to create a full pack of 52 cards
//         and to shuffle the cards.
// author:
// date:
public class Cards
{
    final int NOOFCARDSINFULLPACK = 52;
    
    // properties
    Card[] cards;
    int    valid;  // number of cards currently in collection
    
    // constructors
    public Cards( boolean fullPack)
    {
        cards = new Card[ NOOFCARDSINFULLPACK ];
        valid = 0;
        
        if ( fullPack)
            createFullPackOfCards();
    }
    
    // methods
    public Card getTopCard()
    {
        Card tmp;

        if ( valid <= 0)
            return null;
        else
        {
            valid--;
            tmp = cards[valid];
            cards[valid] = null;
            return tmp;
        }
    }
    
    public boolean addTopCard( Card c)
    {
        // If space available, add card
        if ( valid < cards.length)
        {
            cards[valid] = c;
            valid++;
            return true;
        }
        return false;
    }
    
    public Card getCard( int position)
    {
        if ( position < cards.length)
        {
            return cards[position];
        }
        return null;
    }
    
    private void createFullPackOfCards()
    {
        for (int i = 0; i < 52; i++)
        {
          addTopCard( new Card(i) );
        }
    }
    
    public void shuffle()
    {
      //Shuffle cards
      Card temp;
      int position;
      for( int i = 0; i < 52; i++)
      {
        //Randomize a position
        position = (int)(Math.random() * valid);
        //remove the card at that position
        temp = cards[position];
        //put i'th card there
        cards[position] = cards[i];
        //put removed card at i
        cards[i] = temp;
      }
    }
    

    
} // end class Cards
