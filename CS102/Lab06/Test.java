import java.util.ArrayList;
public class Test {
   public static void main( String[] args) {
      
      //Part a
      System.out.println( Lab06.count( "eArhemKheane"));
      
      
      //Part b
      Lab06.toBinary( 10);
      System.out.println();
      
      //Part c
      ArrayList<String> data = new ArrayList<String>();
      data.add("abham");
      data.add("Abeer");
      data.add("Lamiya");
      data.add("Zeina");
      System.out.println( Lab06.orderCheck( data));
      
      //System.out.println(Lab06.intCompare( 8));
      
      //Part d
      Lab06.intOut( 3);
      System.out.println();
      System.out.println(Lab06.toDenary( 11111111));
   }
}