import cs101.sosgame.SOS;
import java.lang.reflect.Method;
import javax.swing.*;
import javax.swing.Timer;
import java.awt.*;
import java.awt.event.MouseListener;
import java.awt.event.MouseListener.*;
import java.awt.event.MouseEvent;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class SOSGUIPanel extends JPanel
{
   private static final int HEIGHT = 370;
   private static final int WIDTH = 300;
   
   SOSCanvas canvas;
   SOS sos;
   String player1;
   String player2;
   
   //int score1;
   //int score2;
   
   JPanel innerPanel;
   JPanel radios;
   JLabel name1;
   JLabel name2;
   JRadioButton sButton;
   JRadioButton oButton;
   ButtonGroup group;
   Timer t;
   
   public SOSGUIPanel( SOS sos, String player1, String player2)
   {
      super();
      Dimension dimension = new Dimension( WIDTH, HEIGHT);
      this.setMaximumSize(dimension);
      //this.setMinimumSize(dimension);
      this.setSize(dimension);
      //this.setBackground(Color.YELLOW);
      this.setLayout(new BorderLayout());
      
      this.sos = sos;
      this.canvas = new SOSCanvas( this.sos);
      ClickListener listener = new ClickListener();
      this.canvas.addMouseListener( listener); 
      this.player1 = player1;
      this.player2 = player2;
      //this.score1 = 0;
      //this.score2 = 0;
      
      //setting properties
      this.name1 = new JLabel();
      this.name1.setOpaque(true);
      this.name1.setBackground( Color.WHITE);
      this.name2 = new JLabel();
      this.name2.setOpaque(true);
      this.name2.setBackground( Color.WHITE);
      this.sButton = new JRadioButton("S");
      this.sButton.setSelected(true);
      this.oButton = new JRadioButton("O");
      this.group = new ButtonGroup();
      this.group.add(sButton);
      this.group.add(oButton);
      //initializing an innerpanel
      this.innerPanel = new JPanel( new BorderLayout());
      Dimension d = new Dimension( WIDTH, 50);
      this.innerPanel.setMaximumSize(d);
      this.innerPanel.setSize(d);
      
      this.radios = new JPanel();
      
      //timer to switch turns
      t = new Timer(3000, new ActionListener() {
         @Override
         public void actionPerformed(ActionEvent event) {
            switchTurns();
            repaint();
         }
         });
      t.start();
      
   }
   
   class ClickListener implements MouseListener 
   {
         @Override
         public void mousePressed( MouseEvent e) 
         {
            //restrt time
            t.start();
            repaint();
            int x;
            int y;
            int cellX;
            int cellY;
            int dimensions = canvas.getDimension();
            int pad = canvas.getDifference();
            x = e.getX();
            y = e.getY();
            
            if( x <= dimensions && y <= dimensions)
            {  
               cellX = (x / pad) + 1;
               cellY = (y / pad) + 1;
               if( sButton.isSelected())
               {
                  sos.play( 's', cellX, cellY);
               }
               else if( oButton.isSelected())
               {
                  sos.play( 'o', cellX, cellY);
               }
            }
         }
         //initializing the other events
         public void mouseClicked(MouseEvent e) {}
         public void mouseEntered(MouseEvent e) {}
         public void mouseExited(MouseEvent e) {}
         public void mouseReleased(MouseEvent e) {}
   }
   
   @Override
   public void paintComponent( Graphics g)
   {
      super.paintComponent( g);
      //painting labels
      this.name1.setText( this.player1 + " : " + this.sos.getPlayerScore1());
      this.name2.setText( this.player2 + " : " + this.sos.getPlayerScore2());
      
      if( sos.getTurn() == 1)
      {
         this.name1.setBackground( Color.GREEN);
         this.name2.setBackground( Color.WHITE);
      }
      else if( sos.getTurn() == 2)
      {
         this.name2.setBackground( Color.GREEN);
         this.name1.setBackground( Color.WHITE);
      }
      
      this.add( canvas, BorderLayout.CENTER);
      this.innerPanel.add( this.name1, BorderLayout.WEST);
      this.radios.add( this.sButton);
      this.radios.add( this.oButton);
      this.innerPanel.add( this.radios, BorderLayout.CENTER);
      this.innerPanel.add( this.name2, BorderLayout.EAST);
      this.add( this.innerPanel, BorderLayout.SOUTH);
      
      
   }
   
   //switching turns
   public void switchTurns()
   {
      try {
            Method m = SOS.class.getDeclaredMethod("changeTurn", new Class<?>[]{});
            m.setAccessible(true);
            m.invoke(this.sos);
        } catch (Exception e) {
            e.printStackTrace();
        }
   }
}