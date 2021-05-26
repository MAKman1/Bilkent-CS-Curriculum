package shapes;

import java.util.ArrayList;
import java.util.Iterator;
public class ShapeContainerIterator implements Iterator
{
   ArrayList<Shape> shapes;
   int index;
   
   public ShapeContainerIterator( ArrayList<Shape> data)
   {
      shapes = data;
      index = 0;
   }
   
   public boolean hasNext()
   {
      if( index < shapes.size())
         return true;
      else {
         if( index == shapes.size() - 1) {
            this.index = 0;
         }
         return false;
      } 
   }
   
   public Shape next()
   {
      index++;
      return shapes.get(index - 1);
   }
}