package Lab03a;
import java.util.Scanner;
//tester class
public class ShapeTester
{
   public static void main( String[] args)
   {
      Scanner scan = new Scanner( System.in);
      
      //Variables
      int selection;
      ShapeContainer container;
      Shape found;
      container = null;
      
      //Loops till 0 entered
      do
      {
         //preint the header
         System.out.println();
         System.out.println();
         System.out.println("1 - Initiate a collection");
         System.out.println("2 - Add a circle to the collection");
         System.out.println("3 - Add a rectangle to the collection");
         System.out.println("4 - Output the total Surface Area");
         System.out.println("5 - Output data about the collection");
         System.out.println("6 - Remove all selected elements");
         System.out.println("7 - Find shapes with elements");
         System.out.println("8 - Relocate Shape");
         System.out.println("0 - Exit");
         System.out.print("Please select an option: ");
         selection = scan.nextInt();
            
         if( selection == 1)
         {
            container  = new ShapeContainer();
         }
         else if( selection == 2 && container != null)
         {
            System.out.print("Enter the radius:");
            container.add( new Circle( scan.nextInt()));
         }
         else if( selection == 3 && container != null)
         {
            System.out.print("Enter the width and height:");
            container.add( new Rectangle( scan.nextInt(), scan.nextInt()));
         }
         else if( selection == 4 && container != null)
         {
            System.out.println("Total surface area: " + container.getArea());
         }
         else if( selection == 5 && container != null)
         {
            System.out.println(container.toString());
         }
         else if( selection == 6 && container != null)
         {
            container.removeAllSelected();
         }
         else if( selection == 7 && container != null)
         {
            //finding the shape that has a particular coordinate
            System.out.print("Enter x and y: ");
            found = container.selectShape(scan.nextInt(), scan.nextInt());
            if (found == null)
               System.out.println("No such shape found!");
            else
               System.out.println("Shape selected: " + found.toString());
         }
         else if( selection == 8 && container != null)
         {
            //select an item to move
            System.out.println(container.toString());
            System.out.print("Please select an item: ");
            container.relocateShape( scan.nextInt());
            
         }
      } while( selection != 0);
      
      scan.close();
   }
}