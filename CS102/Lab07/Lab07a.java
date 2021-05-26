import cs102.ds.*;
public class Lab07a{
   public static void main( String[] args){
      
      List list = new List();
      
      System.out.println(list.isEmpty());
      
      list.addToHead( "Arham");
      list.addToHead( "Abeer");
      list.addToHead( "Fakhouri");
      list.addToTail( "Khan");
      
      list.print();
      System.out.println();
      
      list.removeFromHead();
      
      list.print();
      System.out.println();
      
      System.out.println(list.isEmpty());
      System.out.println( list.getData( 3));
      
      list.printReverse();
      
   }
}