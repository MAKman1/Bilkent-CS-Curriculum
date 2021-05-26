public class List{
   public Node head;
   
   public List(){
      head = null;
   }
   
   public void addToHead( String item){
      Node temp = head;
      head = new Node( item);
      head.setNext( temp);
   }
   
   public String addToTail( String item){
         Node currentNode = head;
         while( currentNode.getNext() != null){
            currentNode = currentNode.getNext();
         }
         if( currentNode.getNext() == null)
            currentNode.setNext( new Node( item));
         return item;
   }
   
   public String removeFromHead(){
      if( !isEmpty()){
         Node temp = head;
         head = temp.getNext();
         return temp.getName();
      }
      return null;
   }
   
   public boolean isEmpty(){
      return (head == null);
   }
   
   public String getData( int index){
      Node currentNode = head;
      for( int i = 0; i < index; i++){
         currentNode = currentNode.getNext();
         if( currentNode == null)
            return null;
      }
      return currentNode.getName();
   }
   
   public void print(){
      Node currentNode = head;
      while( currentNode != null){
         System.out.println( currentNode.getName());
         currentNode = currentNode.getNext(); 
      }
   }
   
   public void printReverse(){
      recursivePrint( head);
   }
   
   public void recursivePrint( Node head){
      if( head == null)
         return;
      else{
         recursivePrint( head.getNext());
         System.out.println( head.getName());
      }
   }
   
   
   private class Node{
      public String name;
      public Node nextNode;
      
      public Node( String name){
         this.name = name;
         nextNode = null;
      }
      public void setNext( Node temp){
         nextNode = temp;
      }
      public Node getNext(){
         return nextNode;
      }
      public String getName(){
         return this.name;
      }
   }
}