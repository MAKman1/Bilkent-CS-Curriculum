public class BigNumTest
{
   // properties
   // constructors
    // methods
   public static void main (String[] args)
   {
      
      BigNum b1;
      BigNum b2;
      b1 = new BigNum("10");
      b2 = new BigNum("110");  
      
      System.out.println(b1);
      System.out.println(b2);
      
      //b1.shift(false);

      
      int return1 = b1.add(b2);
      
      System.out.println(return1);
      System.out.println(b1);
   }

}