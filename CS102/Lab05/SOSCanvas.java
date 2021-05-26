import cs101.sosgame.SOS;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;


public class SOSCanvas extends JPanel
{
   //variables
   private static final int DIMENSION = 300;
   SOS sos;
   int lineDifference;
   JLabel[][] labels;
   //constructors
   public SOSCanvas( SOS sos)
   {
      super();
      this.sos = sos;
      Dimension dimension = new Dimension( DIMENSION, DIMENSION);
      this.setMaximumSize(dimension);
      this.setSize(dimension);
      //this.setBackground( Color.GREEN);
      
      //initializing labels
      this.labels = new JLabel[sos.getDimension()][sos.getDimension()];
      for( int count = 0; count < sos.getDimension(); count++)
      {
         for( int y = 0; y < sos.getDimension(); y++)
         {
            this.labels[count][y] = new JLabel();
            this.labels[count][y].setFont(new Font("Serif", Font.PLAIN, 20));
            this.labels[count][y].setForeground( Color.RED);
         }
      }
      //calculating the padding
      lineDifference = DIMENSION / sos.getDimension();
      
      //initializing refresh timer
      new Timer(100, new ActionListener() {
         @Override
         public void actionPerformed(ActionEvent event) {
            repaint();
         }
      }).start();
      
      
      //sos.play('s', 2, 3);

   }

   @Override
   public void paintComponent( Graphics g)
   {
      super.paintComponent( g);
      //this.removeAll();
      int positionX;
      int positionY;
      
      //paint lines
      positionX = 0;
      positionY = 0;
      for( int count = 0; count <= sos.getDimension(); count++)
      {
         g.drawLine(positionX, positionY, positionX + DIMENSION, positionY);
         positionY = positionY + lineDifference;
      }
      
      positionX = 0;
      positionY = 0;
      for( int count = 0; count <= sos.getDimension(); count++)
      {
         g.drawLine(positionX, positionY, positionX, positionY + DIMENSION);
         positionX = positionX + lineDifference;
      }

      
      //adding labels
      int padding = lineDifference / 2 - 5;
      int dimension = sos.getDimension();
      for( int count = 0; count < dimension; count++)
      {
         for( int y = 0; y < dimension; y++)
         {
            this.labels[count][y].setLocation( (count * this.lineDifference) + padding, (y * this.lineDifference) + padding);
            this.labels[count][y].setText( "" + this.sos.getCellContents(count, y));
            super.add(this.labels[count][y]);
         }
      }
      
   }
   
   public int getDifference()
   {
      return this.lineDifference;
   }
   public int getDimension()
   {
      return DIMENSION;
   }
}