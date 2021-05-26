/**
 * HTML filtered reader class that extends on My simpleURLReader
 */
public class HTMLFilteredReader extends MySimpleURLReader
{
   //Constructors
   public HTMLFilteredReader( String url)
   {
      super( url);
   }
   
   
   //Methods
   
   /**
    * @return the textual contents in the html page 
    * A method that gets the page text contents only of the html page
    */
   @Override
   public String getPageContents()
   {
      //variables
      String input;
      String output;
      boolean html;
    
      //getting the original contents from the parent page
      input = super.getPageContents();
      output = "";
      html = false;

      //iterating over each char in the string 
      for (int i = 0; i < input.length(); i++)
      {
         if (input.charAt(i) == '<')
            html = true;
         else if (input.charAt(i) == '>')
            html = false;
         else if (html == false)
         {
            //Adding the char
            output = output + input.charAt(i);
         }
         
         
      }
      
      return output;
   }
   
   /*
    * A function that uses the parent object to return the unfiltered contents
    * @return the unfiltered contents
    */
   public String getUnfilteredPageContents()
   {
      return super.getPageContents();
   }
}