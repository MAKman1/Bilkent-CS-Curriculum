import cs101.sosgame.SOS;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class SOSGamePlay 
{
   //variables
   public static final int FRAME_WIDTH = 300;
   public static final int FRAME_HEIGHT = 370;
   
   public static String PLAYER_1;
   public static String PLAYER_2;
   public static int DIMENSION;
   public static JFrame frame;
   public static SOSCanvas canvas;
   public static SOSGUIPanel panel;
   public static SOS sos;
   
   
   public static void main( String[] args)
   {
      //taking names
      PLAYER_1 = JOptionPane.showInputDialog("Player 1 name:");
      PLAYER_2 = JOptionPane.showInputDialog("Player 2 name:");
      
      do {
         DIMENSION = Integer.parseInt(JOptionPane.showInputDialog("Enter the grid dimensions"));
      } while( DIMENSION < 3 || DIMENSION > 10);
      
      addComponents();
      //updating the frame
      new Timer(100, new ActionListener() {
         @Override
         public void actionPerformed(ActionEvent event) {
            frame.revalidate();
            if( sos.isGameOver())
            {
               if( sos.getPlayerScore1() == sos.getPlayerScore2())
               {
                  int reply = JOptionPane.showConfirmDialog(null, "It was a draw. Do you wish to play again?", "GAME ENDS", JOptionPane.YES_NO_OPTION);
                  if (reply == JOptionPane.YES_OPTION)
                  {
                     restart();
                  }
                  else
                     System.exit(0);
               }
               else if( sos.getPlayerScore1() > sos.getPlayerScore2())
               {
                  int reply = JOptionPane.showConfirmDialog(null, "Player 1 wins. Do you wish to play again?", "GAME ENDS", JOptionPane.YES_NO_OPTION);
                  if (reply == JOptionPane.YES_OPTION)
                  {
                     restart();
                  }
                  else
                     System.exit(0);
               }
               else if( sos.getPlayerScore1() < sos.getPlayerScore2())
               {
                  int reply = JOptionPane.showConfirmDialog(null, "Player 2 wins. Do you wish to play again?", "GAME ENDS", JOptionPane.YES_NO_OPTION);
                  if (reply == JOptionPane.YES_OPTION)
                  {
                     restart();
                  }
                  else
                     System.exit(0);
               }
            }
         }
      }).start();
      
   }
   //restarting game
   public static void restart()
   {
      frame.getContentPane().removeAll();
      sos = new SOS( DIMENSION);
      panel = new SOSGUIPanel( sos, PLAYER_1, PLAYER_2);
      frame.add( panel, BorderLayout.CENTER);
      //frame.revalidate();
   }
   
   //initialiing components
   public static void addComponents()
   {
      //frame.removeAll();
      sos = new SOS( DIMENSION);
      frame = new JFrame();
      //canvas = new SOSCanvas( sos);
      panel = new SOSGUIPanel( sos, PLAYER_1, PLAYER_2);
      
      frame.setSize(FRAME_WIDTH, FRAME_HEIGHT);
      frame.setTitle("GUESS GAME!");
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      frame.setResizable( false);
      frame.setVisible(true);
      frame.setLayout(new BorderLayout());
      //frame.add( canvas, BorderLayout.NORTH);
      frame.add( panel, BorderLayout.CENTER);
   }
}