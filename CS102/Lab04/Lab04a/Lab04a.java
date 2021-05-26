import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
/**
This program displays an empty frame.
*/
public class Lab04a   
{
   //variables
   public static int tries;
   public static JButton[][] buttons;
   //initializing the components
    public static JFrame frame;
    public static JPanel panel;
    public static JPanel upperPanel;
    public static JLabel text;
    
    public static final int DIMENSIONS = 5;
    public static final int FRAME_WIDTH = 400;
    public static final int FRAME_HEIGHT = 400;
    public static final int TEXT_HEIGHT = 100;
    public static final int TEXT_WIDTH = 400;
    public static int locationX;
    public static int locationY;
    public static int mineX;
    public static int mineY;
   
   public static void main(String[] args)
   {

      frame = new JFrame();
      tries = 0;
      //finding which button contains the *
      locationX = (int) (Math.random() * DIMENSIONS);
      locationY = (int) (Math.random() * DIMENSIONS);
      
      mineX = (int) (Math.random() * DIMENSIONS);
      mineY = (int) (Math.random() * DIMENSIONS);
      
      panel = new JPanel();
      upperPanel = new JPanel();
      text =  new JLabel();
      //Altering the properties of the parent frame
      frame.setSize(FRAME_WIDTH, FRAME_HEIGHT);
      frame.setTitle("GUESS GAME!");
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      frame.setVisible(true);
      
      /*
       * Inner class to implement actionListener
       */
      class ClickListener implements ActionListener{
         public void actionPerformed( ActionEvent event){
            //Getting which button was clicked
            JButton temp = (JButton) event.getSource();
            
            //If correct button found
            if(buttons[locationX][locationY] == temp){
               text.setText("Game won in " + tries + " tries!");
               buttons[locationX][locationY].setBackground(Color.GREEN);
               panel.setEnabled(false);
               int reply = JOptionPane.showConfirmDialog(null, "Do you wish to play again?", "GAME ENDS", JOptionPane.YES_NO_OPTION);
               if (reply == JOptionPane.YES_OPTION) {
                  //buttons
                  addComponents();
               }
               else {
                  System.exit(0);
               }
               
            }
            else if( buttons[mineX][mineY] == temp) {
               text.setText("You clicked a mine");
               buttons[mineX][mineY].setBackground(Color.RED);
               JOptionPane.showMessageDialog(null, "You clicked a mine!","Game lost",JOptionPane.ERROR_MESSAGE);
               panel.setEnabled(false);
               addComponents();
            }
            else{
               tries++;
               text.setText("Number of tries: " + tries);
               
               //disabling the clicked button
               for( int j = 0; j < DIMENSIONS; j++){
                  for( int k = 0; k < DIMENSIONS; k++){
                     if(buttons[j][k] == temp){
                        buttons[j][k].setEnabled(false);
                        
                     }
                  }
               } 
               
               
            }
         }
      }
      
      //Adding the clicklistener
      ClickListener listener = new ClickListener();
      
      //Inintializing the buttons Array
      buttons = new JButton[DIMENSIONS][DIMENSIONS];
      
      //Initializing the JLabel containing game data
      text.setText("Number of tries: " + tries);
      text.setSize(TEXT_WIDTH, TEXT_HEIGHT);
      text.setHorizontalAlignment(SwingConstants.CENTER);
      
      //setting layout for the panel
      panel.setLayout(new GridLayout(DIMENSIONS, DIMENSIONS));
      
      //Adding listener to all buttons
      // Adding buttons to the panel
      for( int count = 0; count < DIMENSIONS; count++)
      {
         for( int i = 0; i < DIMENSIONS; i++)
         {
            buttons[count][i] = new JButton("*");
            buttons[count][i].setBackground(Color.YELLOW);
            buttons[count][i].addActionListener(listener);
            panel.add(buttons[count][i]);
         }
      }
      upperPanel.setLayout(new BoxLayout(upperPanel, BoxLayout.Y_AXIS));
      upperPanel.add(text);
      upperPanel.add(panel);
      frame.add(upperPanel);

      
   }
   
   public static void addComponents() {
      
      tries = 0;
      //finding which button contains the *
      locationX = (int) (Math.random() * DIMENSIONS);
      locationY = (int) (Math.random() * DIMENSIONS);
      
      
      mineX = (int) (Math.random() * DIMENSIONS);
      mineY = (int) (Math.random() * DIMENSIONS);
      
      frame.getContentPane().removeAll();
      System.out.println("Hey");
      panel = new JPanel();
      upperPanel = new JPanel();
      text =  new JLabel();
     
      //Initializing the JLabel containing game data
      text.setText("Number of tries: " + tries);
      text.setSize(TEXT_WIDTH, TEXT_HEIGHT);
      text.setHorizontalAlignment(SwingConstants.CENTER);
      
      //setting layout for the panel
      panel.setLayout(new GridLayout(DIMENSIONS, DIMENSIONS));
      
      //Adding listener to all buttons
      // Adding buttons to the panel
      for( int count = 0; count < DIMENSIONS; count++)
      {
         for( int i = 0; i < DIMENSIONS; i++)
         {
            buttons[count][i].setEnabled( true);
            buttons[count][i].setBackground(Color.YELLOW);
            panel.add(buttons[count][i]);
         }
      }
      upperPanel.setLayout(new BoxLayout(upperPanel, BoxLayout.Y_AXIS));
      upperPanel.add(text);
      upperPanel.add(panel);
      frame.add(upperPanel);
      frame.revalidate();
   }
}