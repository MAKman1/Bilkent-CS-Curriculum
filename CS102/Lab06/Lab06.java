import java.util.ArrayList;
public class Lab06 {
   private static final char[] digits = {0,1,2,3,4,5,6,7,8,9};
   
   /**
    * counts the number of e in the passed text String
    * @return the count of e
    * @param text the text input
    */
   public static int count( String text) {
      int count;
      count = 0;
      //base case
      if( text.length() < 1)
         return count;
      //if the text > 1
      else {
         if( text.charAt( 0) == 'e')
            count++;
         
         count = count + count( text.substring( 1));
         return count;
      }
   }
   
   /**
    * Recursively converts numbers into binary
    * @param num the integers that needs to be converted
    */
   public static void toBinary( int num) {
      
      if( num == 1)
         System.out.print("1");
      else if( num == 0)
         System.out.print("0");
      else {
         toBinary( (num - (num % 2)) / 2);
         System.out.print( num % 2);
      }
   }
   

   /**
    * convert binary to denary
    * @param num the binary num
    */
   public static int toDenary( int num) {
      String temp;
      int value;
      temp = "" + num;
      //System.out.println( temp);
      if( temp.length() == 1)
         return Integer.parseInt( temp);
      else {
         if( temp.charAt( 0) == '1')
            value = (int) Math.pow( 2, temp.length() - 1);
         else
            value = 0;
         
         num = value + toDenary( Integer.parseInt( temp.substring( 1)));
         return num;
      }
   }
   
   
   
   /**
    * a method that checks if all the elements of an ArrayList are in lexi order
    * @param list the list containing Strings
    * @return the boolean if all are in order
    */
   public static boolean orderCheck( ArrayList<String> list) {
      
      if( list.size() <= 1)
         return true;
      else {
         //comparing if all are recursively in order
         return (list.get( 0).charAt( 0) <= list.get( 1).charAt( 0)) && (orderCheck( splitArray( list)));
      }
   }
   
   /**
    * support method used to split the array by removing the first element from it
    * @param data the current array
    * @return the new array
    */
   public static ArrayList<String> splitArray( ArrayList<String> data) {
      ArrayList<String> output = new ArrayList<String>();
      for(int i = 1; i < data.size(); i++) {
         output.add( data.get( i));
      }
      
      return output;
   }
   
   /**
    * A method that takes the size of numbers to print, and the smalest int with that size
    * @param size the length of integers to be generated
    * @param num the smallest num
    */
   public static void printNum( int size, int num) {
      //System.out.println("++" + num);
      if( (num % ( (int) Math.pow( 10, size))) == 0)
         return;
      else {
         if( intCompare( num))
            System.out.print( num + ", ");
         printNum( size, num + 2);
            
      }   
   }
   /**
    * pilot method that prints the numbers just by size
    * @param size the length of nums
    */
   public static void intOut( int size) {
      printNum( size, (int) Math.pow( 10, size - 1));
   }
   
   /**
    * the method that recursively checks if the current numbers digits are in increasing order
    * @param num the number to check
    * @return if all digits are in increasing order.
    */
   public static boolean intCompare( int num) {
      String temp;
      temp = "" + num;
      if(num < 10)
         return true;
      else {
         return ((temp.charAt(0) < temp.charAt(1)) && intCompare( Integer.parseInt(temp.substring( 1))));
      }
   }
}