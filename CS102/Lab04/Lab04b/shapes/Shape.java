package shapes;
import javax.swing.JComponent;

//The shape parent abstrcat class
public abstract class Shape extends JComponent implements Locatable
{
   //Variables
   public int x;
   public int y;
   public boolean mine;
   
   //Constructor of the locations
   public Shape()
   {
      this.mine = false;
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
   
      public void setMine() {
      this.mine = true;
   }
   
   public boolean getMine() {
      return this.mine;
   }
   
   public abstract boolean getSelected();
   
   public abstract Shape containsPoint(int x, int y);
}