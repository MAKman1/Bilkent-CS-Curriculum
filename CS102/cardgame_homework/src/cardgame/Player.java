package cardgame;

// Player - Simple card game player with name and hand of cards
// author:
// date:
public class Player
{
    // properties
    String name;
    Cards hand;
    
    // constructors
    public Player( String name)
    {
      this.name = name;
      this.hand = new Cards( false);
    }
    
    // methods
    public String getName()
    {
        return this.name;
    }
    
    public void add( Card c)
    {
      this.hand.addTopCard( c);
    }
    
    public Card playCard()
    {
        return this.hand.getTopCard();
    }
    
} // end class Player
