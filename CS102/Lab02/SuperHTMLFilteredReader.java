import java.util.ArrayList;


public class SuperHTMLFilteredReader extends HTMLFilteredReader
{
   //Constructors
   public SuperHTMLFilteredReader( String url)
   {
      super( url);
   }
   
   //Methods
   /*
    * Method to get the links availale in a page
    * @return Arraylist of the links\
    */
   public ArrayList<String> getLinks()
   {
      //variables
      String input;
      ArrayList<String> output;
      int beginPosition;
      int lastPosition;
      int temp;
      //Program code
      input = super.getUnfilteredPageContents();
      output = new ArrayList<String>();
      beginPosition = 0;
      lastPosition = 0;
      temp = 0;
      //iterating over each char
      for (int i = 0; i < input.length(); i++)
      {
         //finding the href tag
         beginPosition = input.indexOf("href=", temp);
         if( beginPosition != -1)
         {
            lastPosition = input.indexOf(">", beginPosition + 1);
            output.add( input.substring(beginPosition + 5, lastPosition));
            temp = lastPosition;
         }
      }
      
      return output;
   }
   
   /*
    * A function that returns the over head of a file, as in the html size vs text size
    * @return percentage comparison
    */
   public double getOverhead()
   {
      double originalSize;
      double filteredSize;
      
      originalSize = (double) super.getUnfilteredPageContents().length();
      filteredSize = (double) super.getPageContents().length();
      
      //returning the percentage calculated.
      return (((originalSize / filteredSize) - 1) * 100);
      
         
   
   }
}