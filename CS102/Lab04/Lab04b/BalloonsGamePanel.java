import shapes.ShapeContainer;
import javax.swing.Timer;
import java.util.Iterator;
import javax.swing.*;
import java.awt.event.ActionListener;
import java.awt.event.MouseListener;
import java.awt.event.MouseListener.*;
import java.awt.event.MouseEvent;
import java.awt.event.ActionEvent;
import java.awt.*;



public class BalloonsGamePanel extends JPanel{
   
   //properties
   //finals
   public static final int FRAME_WIDTH = 650;
   public static final int FRAME_HEIGHT = 600;
   public static final int INITIAL_DRAW = 40;
   public static final int MIN_BALLOONS = 15;
   public static final int MAX_TIME = 5000;
   
   ShapeContainer balloons;
   JLabel text;
   int points;
   int timeElapsed;
   int mineCount;
   
   //constructors
   public BalloonsGamePanel() {
      
      points = 0;
      timeElapsed = 0;
      mineCount = 0;
      
      //setting the layout of the panel
      //this.setLayout(new FlowLayout());
      this.setLayout( new BorderLayout());
      //this.setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
      this.setSize(new Dimension( FRAME_WIDTH, FRAME_HEIGHT));
      Dimension mySize = new Dimension(FRAME_WIDTH, FRAME_HEIGHT);
      this.setPreferredSize(mySize);
      this.setMaximumSize(mySize);
      this.setBackground(Color.black);
      
      
      //adding the text
      text = new JLabel("", JLabel.CENTER);
      this.add(text, BorderLayout.PAGE_START);
      //text.setText("Points: 0");
      text.setForeground(Color.white);
      
      //inintializing the mouseListener
      this.addMouseListener(new MouseListener() {
         @Override
         public void mousePressed( MouseEvent e) {
            //seeing which baloons was clicked
            int tempPoints = balloons.selectAllAt(e.getX(), e.getY());
            //if a mine was clicked
            if( tempPoints == -1) {
               points = 0;
               //balloons.
               JOptionPane.showMessageDialog(null, "The balloon was a mine!","WRONG CLICK!",JOptionPane.ERROR_MESSAGE);
            }
            //if two or more mines were clicked
            if( tempPoints >= 2) {
               points = points + tempPoints;
            }
         }
         //initializing the other events
         public void mouseClicked(MouseEvent e) {}
         public void mouseEntered(MouseEvent e) {}
         public void mouseExited(MouseEvent e) {}
         public void mouseReleased(MouseEvent e) {}
      });
      
      
      
      //inintializing the balloon container
      balloons = new ShapeContainer();
      boolean temp;
      
      //drawing the balloons
      int mineNumber = (int) (Math.random() * INITIAL_DRAW);
      System.out.println(mineNumber);
      for (int count = 0; count < INITIAL_DRAW - 1; count++) {
         //seeing if a random number of mines have already been constructed
         if (mineCount < mineNumber) {
            temp = true;
            mineCount++;
         }
         else
            temp = false;
         
         balloons.add( new Balloon(randomX(), randomY(), temp));
      }
      
      //iniializing timer to grow balloons
      new Timer(250, new ActionListener() {
         @Override
         public void actionPerformed(ActionEvent event) {
            Balloon temp;
            Iterator balloonCollection = balloons.iterator();
            while( balloonCollection.hasNext()) {
               
               temp = (Balloon) balloonCollection.next();
               temp.grow();
            }
            repaint();

         }
      }).start();
      
      
      //timer to add balloons if number is less
      new Timer(250, new ActionListener() {
         @Override
         public void actionPerformed(ActionEvent event) {
            while( balloons.size() < MIN_BALLOONS) {
               balloons.add( new Balloon(randomX(), randomY(), false));
            }
            //remove all selected balloons
            balloons.removeAllSelected();
            text.setText("Points: " + points);
            timeElapsed = timeElapsed + 250;

         }
      }).start();
   }

   
   @Override
   public void paintComponent( Graphics g) {
      super.paintComponent( g);
      Balloon temp;
      Iterator elements = balloons.iterator();
      
      while( elements.hasNext()) {
         temp = (Balloon) elements.next();
         temp.draw( g);
         this.add(temp);
      }
   }
   
   //return random X index in the panel
   public int randomX() {
      return (int) (Math.random() * this.getWidth()) - 50; 
   }
   
   public int randomY() {
      return (int) (Math.random() * this.getHeight()) - 50; 
   }
   
   public int returnTime() {
      return this.timeElapsed;
   }
}