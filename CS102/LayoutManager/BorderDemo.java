//********************************************************************
//  BorderDemo.java       Authors: Lewis/Loftus
//
//  Demonstrates the various types of borders.
//********************************************************************

import java.awt.*;
import javax.swing.*;
import javax.swing.border.*;

public class BorderDemo
{
   //-----------------------------------------------------------------
   //  Creates several bordered panels and displays them in a frame.
   //-----------------------------------------------------------------
   public static void main (String[] args)
   {
      JFrame frame = new JFrame ("Border Demo");
      frame.setDefaultCloseOperation (JFrame.EXIT_ON_CLOSE);

      JPanel panel = new JPanel();
      panel.setLayout (new GridLayout (0, 2, 5, 10));
      panel.setBorder (BorderFactory.createEmptyBorder (5, 5, 5, 5));

      JPanel p1 = new JPanel();
      p1.setBorder (BorderFactory.createLineBorder (Color.red, 3));
      p1.add (new JLabel ("Line Border"));
      panel.add (p1);

      JPanel p2 = new JPanel();
      p2.setBorder (BorderFactory.createEtchedBorder ());
      p2.add (new JLabel ("Etched Border"));
      panel.add (p2);

      JPanel p3 = new JPanel();
      p3.setBorder (BorderFactory.createRaisedBevelBorder ());
      p3.add (new JLabel ("Raised Bevel Border"));
      panel.add (p3);

      JPanel p4 = new JPanel();
      p4.setBorder (BorderFactory.createLoweredBevelBorder ());
      p4.add (new JLabel ("Lowered Bevel Border"));
      panel.add (p4);

      JPanel p5 = new JPanel();
      p5.setBorder (BorderFactory.createTitledBorder ("Title"));
      p5.add (new JLabel ("Titled Border"));
      panel.add (p5);

      JPanel p6 = new JPanel();
      TitledBorder tb = BorderFactory.createTitledBorder ("Title");
      tb.setTitleJustification (TitledBorder.RIGHT);
      p6.setBorder (tb);
      p6.add (new JLabel ("Titled Border (right)"));
      panel.add (p6);

      JPanel p7 = new JPanel();
      Border b1 = BorderFactory.createLineBorder (Color.blue, 2);
      Border b2 = BorderFactory.createEtchedBorder ();
      p7.setBorder (BorderFactory.createCompoundBorder (b1, b2));
      p7.add (new JLabel ("Compound Border"));
      panel.add (p7);

      JPanel p8 = new JPanel();
      Border mb = BorderFactory.createMatteBorder (1, 5, 1, 1,
                                                   Color.yellow);
      p8.setBorder (mb);
      p8.add (new JLabel ("Matte Border"));
      panel.add (p8);

      frame.getContentPane().add (panel);
      frame.pack();
      frame.show();
   }
}
