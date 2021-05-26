public class Lab10b
{
   // properties
   // constructors
    // methods
   public static void main (String[] args)
   {
     //variables
     BigNum[] array;
     String random;
     
     //Program Code
     array = new BigNum[10];
     for (int count = 0; count < 10; count++)
     {
       //Generating the random string
       random = "";
       for (int i = 0; i < BigNum.SIZE; i++)
       {
         random = random + (int) Math.round( Math.random() * (BigNum.BASE - 1) );
       }
       //Adding the random string to Array
       array[count] = new BigNum(random);
     }
     
     
     for (BigNum temp: array)
     {
       System.out.println(temp);
     }
     
   }

}