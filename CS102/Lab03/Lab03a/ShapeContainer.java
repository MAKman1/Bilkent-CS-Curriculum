package Lab03a;

import java.util.ArrayList;
import java.util.Scanner;

//A container of different shape objects
public class ShapeContainer
{
   Scanner scan = new Scanner( System.in);
   
   //Variables
   ArrayList<Shape> data;
   
   ShapeContainerIterator iterator;
   
   //Contructor
   public ShapeContainer()
   {
      data = new ArrayList<Shape>();
      iterator = new ShapeContainerIterator( data);
   }
   
   /*
    * add shapes to the data container
    * @param s the shape itself
    */
   public void add( Shape s)
   {
      data.add( s);
   }
   
   /*
    * Return the total area of all the shapes in the collectio
    * @return the double area
    */
   public double getArea()
   {
      double totalArea;
      totalArea = 0;
     
      while(this.iterator.hasNext())
      {
         totalArea = totalArea + iterator.next().getArea();
      }
      
      return totalArea;
   }
   
   /*
    * return data about all the shapes in the collection
    * @return the String containning all data
    */
   public String toString()
   {
      String output;
      output = "";
      
      for (Shape temp: data)
      {
         output = output + temp.toString() + "\n";
      }
      
      return output;
   }
   
   /*
    * removing all the elements from the container that are selected
    */
   public void removeAllSelected()
   {
      for( int i = 0; i < this.data.size(); i++)
      {
         if( this.data.get(i).getSelected() == true)
            this.data.remove(i);
      }
   }
   
   /*
    * selects the first shape that contains the specified x and y cordinates
    * @return the shape that contains the x and y, otherwise return null
    * @param x the x-cord
    * @param y the y-cord
    */
   public Shape selectShape(int x, int y)
   {
      //loop through all ellements in the array
      for( Shape temp: this.data)
      {
         if (temp.contains( x, y) != null)
         {
            return temp;
         }    
      }
      return null;
   }
  
   /*
    * A function that relocates the shape to different coordinates
    * @param index the index of the shape in the container
    */
   public void relocateShape( int index)
   {
      System.out.print("Please enter x and y values: ");
      this.data.get(index).setLocation(scan.nextInt(), scan.nextInt());
   }
}