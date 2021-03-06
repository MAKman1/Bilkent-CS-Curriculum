import shapes.*;
import java.awt.*;

public class Mine extends Circle implements Drawable{
 
   public static final int DEFAULT_RADIUS = 25;
   public static final int DEFAULT_GROW = 8;
   public static final int LIMIT = 100;
   
   //public int xPosition;
   //public int yPosition;
   
   
   public Mine(int x, int y) {
      super(DEFAULT_RADIUS);
      this.x = x;
      this.y = y;
      this.mine = true;
      
   }
   

   
   @Override
   public void draw( Graphics g) {
      super.paintComponent( g);
      g.setColor(Color.RED);
      g.drawOval(this.x, this.y, this.radius, this.radius);
   }
   
   public void grow() {
      if( this.radius >= LIMIT) {
         this.setSelected(true);
         this.radius = 0;
      }
      else {
         this.radius = this.radius + DEFAULT_GROW;
      }
   }
}