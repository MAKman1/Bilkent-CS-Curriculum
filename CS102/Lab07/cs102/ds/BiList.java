public class BiList{
public Node head;
public Node tail;
   
   public BiList(){
      head = null;
      tail = null;
   }
   
   public void addToHead( String item){
      Node temp = head;
      head = new Node( item);
      head.setNext( temp);
      if( temp != null)
         temp.setPrevious( head);
      updateTail();
   }
   
   public void updateTail(){
      Node currentNode = head;
      while( currentNode.getNext() != null){
         currentNode = currentNode.getNext();
      }
      tail = currentNode;
   }
   
   public void updateHead(){
      Node currentNode = tail;
      while( currentNode.getPrevious() != null){
         currentNode = currentNode.getPrevious();
      }
      head = currentNode;
   }
   
   public void addToTail( String item){
         Node temp = tail;
         tail = new Node( item);
         tail.setPrevious( temp);
         if( temp != null)
            temp.setNext( tail);
         updateHead();
   }
   
   public String removeFromHead(){
      if( !isEmpty()){
         Node temp = head;
         head = temp.getNext();
         head.setPrevious( null);
         return temp.getName();
      }
      return null;
   }
   public String removeFromTail(){
      if( !isEmpty()){
         Node temp = tail;
         tail = temp.getPrevious();
         tail.setNext( null);
         return temp.getName();
      }
      return null;
   }
   public String remove( String value){
      Node currentNode = head;
      while( currentNode != null && !currentNode.getName().equals( value)){
         currentNode = currentNode.getNext();
      }
      if( currentNode == null){
         return "No node found";
      }
      else{
            Node back = currentNode.getPrevious();
            Node front = currentNode.getNext();
            if( back != null){
               back.setNext( front);
            }
            if( front != null){
               front.setPrevious( back);
            }
            updateHead();
            updateTail();
            return currentNode.getName();
      } 
   }
   
   public void add( String after, String value){
      Node currentNode = head;
      while( currentNode.getNext() != null && !currentNode.getNext().getName().equals( after)){
         currentNode = currentNode.getNext();
      }
      if( currentNode.getNext() == null){
         currentNode.setNext( new Node( value));
         currentNode.getNext().setPrevious( currentNode);
      }
      else{
         currentNode = currentNode.getNext();
         Node back = currentNode;
         Node front = currentNode.getNext();
         back.setNext( new Node( value));
         back.getNext().setPrevious( back);
         back.getNext().setNext( front);
         front.setPrevious( back.getNext());
      }
      
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
      Node currentNode = tail;
      while( currentNode != null){
         System.out.println( currentNode.getName());
         currentNode = currentNode.getPrevious(); 
      }
   }

   
   
   private class Node{
      public String name;
      public Node nextNode;
      public Node previousNode;
      
      public Node( String name){
         this.name = name;
         nextNode = null;
         previousNode = null;
      }
      public void setNext( Node temp){
         nextNode = temp;
      }
      public void setPrevious( Node temp){
         previousNode = temp;
      }
      public Node getNext(){
         return nextNode;
      }
      public Node getPrevious(){
         return previousNode;
      }
      public String getName(){
         return this.name;
      }
   }
}