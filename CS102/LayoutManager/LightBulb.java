//********************************************************************
//  LightBulb.java       Author: Lewis/Loftus
//
//  Demonstrates some special component features such as disabled
//  buttons, mnemonics, tool tips, and borders.
//********************************************************************

import javax.swing.*;
import java.awt.*;

public class LightBulb
{
   //-----------------------------------------------------------------
   //  Sets up a frame that displays a light bulb image that can be
   //  turned on and off.
   //-----------------------------------------------------------------
   public static void main (String[] args)
   {
      JFrame lightBulbFrame = new JFrame ("Light Bulb");
      lightBulbFrame.setDefaultCloseOperation (JFrame.EXIT_ON_CLOSE);

      LightBulbPanel bulb = new LightBulbPanel();
      LightBulbControls controls = new LightBulbControls (bulb);

      JPanel panel = new JPanel();
      panel.setBackground (Color.black);
      panel.setLayout (new BoxLayout(panel, BoxLayout.Y_AXIS));
      panel.add (Box.createRigidArea (new Dimension (0, 20)));
      panel.add (bulb);
      panel.add (Box.createRigidArea (new Dimension (0, 10)));
      panel.add (controls);
      panel.add (Box.createRigidArea (new Dimension (0, 10)));

      lightBulbFrame.getContentPane().add(panel);
      lightBulbFrame.pack();
      lightBulbFrame.show();
   }
}
