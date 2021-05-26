package Lab03a;
public class Rectangle extends Shape implements Selectable
{
   //Variables
   int width;
   int height;
   boolean selected;
   
   
   //constructors
   public Rectangle(int width, int height)
   {
      super();
      this.width = width;
      this.height = height;
      selected = false;
   }
   
   
   //Methods
   /*
    * returns the area of the rectangle
    * @return the calculated are of the shape
    */
   public double getArea()
   {
      return (double)(this.height * this.width);
   }
   
   /*
    * returns data about this rectangle
    * @return the data in a format specified manner
    */
   public String toString()
   {
      return "Rectangle (width: " + this.width + ", height: " + this.height + ", Area: " + this.getArea() + ", selected: " + this.selected + ", (x, y) = (" + this.getX() + ", " + this.getY() + "))";
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
   public boolean getSelected()
   {
      return this.selected;
   }
   
    /*
    * Fucntion that sees if a specified point is actually in the rectangle shape
    * @param x the x-xoordinate to be checked
    * @param y the y-coordinate to be checked
    * @returns itself if the x/ y cordinated lie in the shape
    */
   public Shape contains( int x, int y)
   {
      int xDiff;
      int yDiff;
      
      xDiff = Math.abs(this.width / 2);
      yDiff = Math.abs(this.height / 2);
      
      if( x >= (this.x - xDiff) && x <= (this.x + xDiff) && y >= (this.y - yDiff) && y <= (this.y + yDiff))
      {
         this.selected = true;
         return this;
       
      }
      else
         return null;
   }
}