//********************************************************************
//  LightBulbControls.java       Author: Lewis/Loftus
//
//  Represents the control panel for the LightBulb program.
//********************************************************************

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class LightBulbControls extends JPanel
{
   private LightBulbPanel bulb;
   private JButton onButton, offButton;

   //-----------------------------------------------------------------
   //  Sets up the lightbulb control panel.
   //-----------------------------------------------------------------
   public LightBulbControls (LightBulbPanel bulbPanel)
   {
      bulb = bulbPanel;

      onButton = new JButton ("On");
      onButton.setEnabled (false);
      onButton.setMnemonic ('n');
      onButton.setToolTipText ("Turn it on!");
      onButton.addActionListener (new OnListener());

      offButton = new JButton ("Off");
      offButton.setEnabled (true);
      offButton.setMnemonic ('f');
      offButton.setToolTipText ("Turn it off!");
      offButton.addActionListener (new OffListener());

      setBackground (Color.black);
      add (onButton);
      add (offButton);
   }

   //*****************************************************************
   //  Represents the listener for the On button.
   //*****************************************************************
   private class OnListener implements ActionListener
   {
      //--------------------------------------------------------------
      //  Turns the bulb on and repaints the bulb panel.
      //--------------------------------------------------------------
      public void actionPerformed (ActionEvent event)
      {
         bulb.setOn (true);
         onButton.setEnabled (false);
         offButton.setEnabled (true);
         bulb.repaint();
      }
   }

   //*****************************************************************
   //  Represents the listener for the Off button.
   //*****************************************************************
   private class OffListener implements ActionListener
   {
      //--------------------------------------------------------------
      //  Turns the bulb off and repaints the bulb panel.
      //--------------------------------------------------------------
      public void actionPerformed (ActionEvent event)
      {
         bulb.setOn (false);
         onButton.setEnabled (true);
         offButton.setEnabled (false);
         bulb.repaint();
      }
   }
}
