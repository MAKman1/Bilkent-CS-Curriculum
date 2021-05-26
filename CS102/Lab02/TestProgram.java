import java.util.ArrayList;
import java.util.Scanner;

public class TestProgram
{
   public static void main( String[] args)
   {  //Scanner
      Scanner scan = new Scanner( System.in);
      
      //Variables
      int selection;
      int menuTwo;
      String url;
      ArrayList<MySimpleURLReader> poems;
      
      //Program code
      poems = new ArrayList<MySimpleURLReader>();
      
      //Keep iterating unless 3 entered
      do
      {
         //Print menu
         System.out.println("1 - Enter the url of poem to add to collection");
         System.out.println("2 - List all poems in the collection");
         System.out.println("3 - Quit");
         
         //getting int
         selection = scan.nextInt();
         
         if( selection == 1)
         {
            //Scanning the url
            scan.nextLine();
            System.out.print("Please enter URL: ");
            url = scan.nextLine();
            //Seeing if url is an html page or not
            if( url.indexOf(".htm") < 0)
            {
               //add normal file
               poems.add(new MySimpleURLReader( url));
            }
            else
            {
               //add html
               poems.add(new HTMLFilteredReader( url));
            }
         }
         else if( selection == 2)
         {
            //Printing list of files
            for( int i = 0; i < poems.size(); i++)
            {
               System.out.println(i + " - " + poems.get(i).getName());
            }
            //Asking for options unless size + 1 entered
            do
            {
               System.out.print("Enter selection: ");
               menuTwo = scan.nextInt();
               
            }while (menuTwo > poems.size() || menuTwo < 0);
            
            //printing the poem
            if( menuTwo < poems.size())
            {
               System.out.println(poems.get(menuTwo).getPageContents());
            }
         }
         
      } while (selection != 3);
   }
}