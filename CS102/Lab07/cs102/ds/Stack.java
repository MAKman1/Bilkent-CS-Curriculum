public class Stack{
   public List list;
   
   public Stack(){
      list = new List();
   }
   
   public void push( String name){
      list.addToHead( name);
   }
   
   public String pop(){
      return list.removeFromHead();
   }
   
   public boolean isEmpty(){
      return list.isEmpty();
   }
}