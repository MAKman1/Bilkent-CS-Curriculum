package Lab03a;
public class Square extends Rectangle
{
   //Variables
   int side;
   
   //Constructors
   public Square(int side)
   {
      super(side, side);
      this.side = side;
   }
   //returning the toString of the data
   public String toString()
   {
      return "Square (side: " + this.side + ", Area: " + this.getArea() + ", selected: " + this.selected + ")";
   }
}