package shapes;
//Class of the shape circle
public class Circle extends Shape implements Selectable
{
   //Variables
   public int radius;
   public boolean selected;
   
   //Constructors
   public Circle(int radius)
   {
      super();
      this.radius = radius;
      selected = false;
   }
   
   //Methods
   /*
    * returns the area of the circle
    * @return the calculated are of the shape
    */
   public double getArea()
   {
      return (double) (Math.PI * this.radius * this.radius);
   }
   
   /*
    * returns data about this circle
    * @return the data in a format specified manner
    */
   public String toString()
   {
      return "Circle (radius: " + this.radius + ", Area: " + this.getArea() + ", selected: " + this.selected  + ", (x, y) = (" + this.getX() + ", " + this.getY() + "))";
   }
   
   /*
    * sets the circle shape selected (selects it)
    * @param value the value to be assigned to the shape
    */
   public void setSelected( boolean value)
   {
      this.selected = value;
   }
   
   /*
    * to return whether this shape is selected or not
    * @return the value if its selected or not
    */
   
   public void setRadius( int radius)
   {
      this.radius = radius;
   }
    
   public boolean getSelected()
   {
      return this.selected;
   }
   
   /*
    * Fucntion that sees if a specified point is actually in the circle shape
    * @param x the x-xoordinate to be checked
    * @param y the y-coordinate to be checked
    * @returns itself if the x/ y cordinated lie in the shape
    */
   public Shape containsPoint( int x, int y)
   {
      double distance;
      
      
      x = Math.abs(x - this.x);
      y = Math.abs(y - this.y);
      distance = Math.sqrt(( x * x) + ( y * y));
      if( distance <= (double) this.radius)
      {
         this.selected = true;
         return this;
      }
      else
         return null;
   }
}