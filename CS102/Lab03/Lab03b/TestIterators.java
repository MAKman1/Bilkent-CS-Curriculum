package Lab03b;

import java.util.Scanner;
import java.util.Iterator;

//testing the iteration
public class TestIterators
{
   public static void main( String[] args)
   {
      //Variables
      Scanner scan = new Scanner( System.in);
      final int SIZE = 10;
      
      Iterator i, j;
      IntBag bag;

      //Program code
      bag = new IntBag( SIZE);
      
      //Add values to the intbgag
      for (int a = 0; a < 10; a++)
      {
         bag.add(a);
      }
      //Initialize the iterator
      i = new IntBagIterator( bag);
      
      

      //iterate through the intbag
      while ( i.hasNext() ) 
      {
         System.out.println( i.next() );
 
         j = new IntBagIterator( bag);
         //j = bag.iterator();
 
         while ( j.hasNext() )
         {
            System.out.println( "--" + j.next() );
         }
      }
   }
}