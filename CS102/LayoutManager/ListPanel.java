//********************************************************************
//  ListPanel.java       Authors: Lewis/Loftus
//
//  Represents the list of images for the PickImage program.
//********************************************************************

import java.awt.*;
import javax.swing.*;
import javax.swing.event.*;

public class ListPanel extends JPanel
{
   private JLabel label;
   private JList list;

   //-----------------------------------------------------------------
   //  Loads the list of image names into the list.
   //-----------------------------------------------------------------
   public ListPanel (JLabel imageLabel)
   {
      label = imageLabel;

      String[] fileNames = { "circuit.gif",
                             "duke.gif",
                             "hammock.gif",
                             "justin.jpg",
                             "kayla.jpg",
                             "tiger.jpg",
                             "toucan.gif",
                             "worldmap.gif" };

      list = new JList (fileNames);
      list.addListSelectionListener (new ListListener());
      list.setSelectionMode (ListSelectionModel.SINGLE_SELECTION);

      add (list);
      setBackground (Color.white);
   }

   //*****************************************************************
   //  Represents the listener for the list of images.
   //*****************************************************************
   private class ListListener implements ListSelectionListener
   {
      public void valueChanged (ListSelectionEvent event)
      {
         if (list.isSelectionEmpty())
            label.setIcon (null);
         else
         {
            String fileName = (String)list.getSelectedValue();
            ImageIcon image = new ImageIcon (fileName);
            label.setIcon (image);
         }
      }
   }
}
