//********************************************************************
//  ViewColors.java       Authors: Lewis/Loftus
//
//  Demonstrates the use slider components.
//********************************************************************

import java.awt.*;
import javax.swing.*;

public class ViewColors
{
   //-----------------------------------------------------------------
   //  Presents up a frame with a control panel and a panel that
   //  changes color as the sliders are adjusted.
   //-----------------------------------------------------------------
   public static void main (String[] args)
   {
      JFrame frame = new JFrame ("View Colors");
      frame.setDefaultCloseOperation (JFrame.EXIT_ON_CLOSE);

      JPanel colorPanel = new JPanel();
      colorPanel.setPreferredSize (new Dimension (100, 100));
      colorPanel.setBackground (new Color (0, 0, 0));

      Container cp = frame.getContentPane();
      cp.setLayout (new FlowLayout());
      cp.add (new ViewSliderPanel(colorPanel));
      cp.add (colorPanel);

      frame.pack();
      frame.show();
   }
}
