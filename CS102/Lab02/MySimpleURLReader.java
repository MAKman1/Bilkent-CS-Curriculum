import cs1.SimpleURLReader;

//A class that extends SimpleURLReader and reads files as it is
public class MySimpleURLReader extends SimpleURLReader
{
   //Variables
   String linkURL;
   
   //Constructors
   public MySimpleURLReader( String url)
   {
      super( url);
      this.linkURL = url;
   }
   
   //Methods
   /*
    * The function to return the URL of the link
    * @return the url
    */
   public String getURL()
   {
      return this.linkURL;
   }
   
   /**
    * A method that retursn the filename of the url
    * @return the filename
    */
   public String getName()
   {
      int position = this.linkURL.length() - 1;
      //finding the / character
      while( this.linkURL.charAt( position) != '/')
      {
         position--;
      }
      return this.linkURL.substring((position + 1), this.linkURL.length());
   }
   
   /*
    * Override the parent method to remove the null thing
    * @return the cleaned page content string
    */
   @Override
   public String getPageContents()
   {
      String input;
      String output;
      input = super.getPageContents();
      //remove the null thing
      output = input.substring(4, input.length());
      return output;
   }
}