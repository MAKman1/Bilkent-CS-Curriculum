package Lab03b;
public class IntBagIterator implements IntIterator
{
   
   //Variables
   IntBag aBag;
   int index;
   
   //Constructors
   public IntBagIterator( IntBag bag)
   {
      this.aBag = bag;
      this.index = this.aBag.size() - 1;
   }
   
   /*
    * Seeing if there is another value available
    * @returns if it has it
    */
   public boolean hasNext()
   {
      if( index >= 0)
         return true;
      return false;
   }
   /*
    * get the next element in the intbag
    */
   public Integer next()
   {
      if( hasNext())
      {
         this.index--;
         return this.aBag.get(this.index + 1);
      }
      else
         return null;
   }
   
   /*
    * get the next integer in the intbag (an extension of the intbag)
    */
   public int nextInt()
   {
      this.index--;
      return this.aBag.get(this.index + 1); 
   }
}