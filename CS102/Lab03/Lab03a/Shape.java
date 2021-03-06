package Lab03a;
//The shape parent abstrcat class
public abstract class Shape implements Locatable
{
   //Variables
   public int x;
   public int y;
   
   //Constructor of the locations
   public Shape()
   {
      x = 0;
      y = 0;
   }
   
   public abstract double getArea();
   
   public abstract String toString();
   
   public int getX()
   {
      return this.x;
   }
   public int getY()
   {
      return this.y;
   }
   public void setLocation( int x, int y)
   {
      this.x = x;
      this.y = y;
   }
   
   public abstract boolean getSelected();
   
   public abstract Shape contains(int x, int y);
}