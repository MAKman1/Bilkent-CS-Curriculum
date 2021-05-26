import shapes.*;
import java.awt.*;

public class Balloon extends Circle implements Drawable{
 
   //properties
   public static final int DEFAULT_RADIUS = 25;
   public static final int DEFAULT_GROW = 8;
   public static final int LIMIT = 100;
   
   //public int xPosition;
   //public int yPosition;
   
   //constructors
   public Balloon(int x, int y, boolean mine) {
      super(DEFAULT_RADIUS);
      this.x = x;
      this.y = y;
      this.mine = mine;
      
   }
   

   //the overriden draw function
   @Override
   public void draw( Graphics g) {
      super.paintComponent( g);
      // if this is a mine
      if( this.mine) {
         g.setColor(Color.RED);
      }
      else
         g.setColor(Color.YELLOW);
      
      //draw the circle
      g.drawOval(this.x, this.y, this.radius, this.radius);
   }
   
   
   //increase the size of the balloon
   public void grow() {
      //if the thing is less than the size
      if( this.radius >= LIMIT) {
         this.setSelected(true);
         this.radius = 0;
      }
      else {
         this.radius = this.radius + DEFAULT_GROW;
      }
   }
}