import javax.swing.*;
import java.awt.*;
import javax.swing.Timer;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Lab04b {
   private static final int FRAME_WIDTH = 650;
   private static final int FRAME_HEIGHT = 650;
   private static final int MAX_TIME = 10000;
   
   private static JFrame frame;
   private static BalloonsGamePanel panel;
   
   
   
   public static void main( String[] args){
      
      addComponents();
      
      //timer
      new Timer(100, new ActionListener() {
         @Override
         public void actionPerformed(ActionEvent event) {
            if( panel.returnTime() > MAX_TIME) {
               //asking is game ended
               int reply = JOptionPane.showConfirmDialog(null, "Do you wish to play again?", "GAME ENDS", JOptionPane.YES_NO_OPTION);
               if (reply == JOptionPane.YES_OPTION) {
                  
                  //resetting the game
                  panel.setEnabled( false);
                  panel = new BalloonsGamePanel();
                  frame.getContentPane().removeAll();
                  panel = new BalloonsGamePanel();
                  frame.add( panel);
               }
               else {
                  System.exit(0);
               }
            }
         }
      }).start();

   }
   
   public static void addComponents() {
      
      //resetting the game
      frame = new JFrame();
      frame.setLayout( new BorderLayout());
      frame.setSize(FRAME_WIDTH, FRAME_HEIGHT);
      frame.setTitle("BALLOON POP");
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      frame.setResizable(false);
      frame.setVisible(true);
      
      //reinitializing the panel
      panel = new BalloonsGamePanel();
      panel.setVisible(true);
      
      frame.add( panel);
   }
   
   
}