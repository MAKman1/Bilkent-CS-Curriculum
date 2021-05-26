import cs102.ds.*;
public class Lab07c{
   public static void main( String[] args){
      
      BiList list = new BiList();
      
      System.out.println(list.isEmpty());
      
      list.addToHead( "Arham");
      list.addToHead( "Abeer");
      list.addToHead( "Fakhouri");
      list.addToTail( "Khan");
      list.addToTail( "Vestium");
      
      list.print();
      System.out.println();
      
      list.removeFromHead();
      
      list.print();
      System.out.println();
      
      list.removeFromTail();
      
      list.print();
      System.out.println();
      
      System.out.println(list.isEmpty());
      System.out.println( list.getData( 3));
      
      list.printReverse();
      
      list.add( "Arham", "ARHAMMMMMMMMMMMMMM");
      
      
      System.out.println();
      list.print();
      
      list.remove( "Abeer");
      
      System.out.println();
      list.print();
      
      list.remove( "Khan");
      
      
      System.out.println();
      list.print();
   }
}