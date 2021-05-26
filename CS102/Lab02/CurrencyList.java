import java.util.ArrayList;

public class CurrencyList
{
   //Variables
   final String URL = "http://tcmb.org.tr/kurlar/today.xml";
   //The collection of currencies
   ArrayList<Currency> list;
   MySimpleURLReader reader;
   
   
   public CurrencyList()
   {
      list = new ArrayList<Currency>();
      reader = new MySimpleURLReader( URL);
      
      //Popuate currency list
      this.getValues();
      //Change values n list
      this.convert();
      
   }
   
   public String toString()
   {
      //eturn the list
      String output;
      output = "";
      for (Currency temp: list)
      {
         output = output + temp.getCode() + " - " + temp.getRate() + "\n";
      }
      return output;
   }
   //method to convert
   public void convert()
   {
      Currency temp;
      double mainRate;
      //taking usd rate
      mainRate = this.list.get(0).getRate();
      for (int i = 0; i < list.size(); i++)
      {
         //Altering each element by dividing it by usd rate
         temp = this.list.get(i);
         temp.modifyRate(temp.getRate() / mainRate);
      }
   }
   
   public void getValues()
   {
      //variables
      String input;
      String tempString;
      String rate;
      String code;
      int beginPosition;
      int lastPosition;
      int temp;
      //Program code
      input = reader.getPageContents();
      beginPosition = 0;
      lastPosition = 0;
      temp = 0;
      //iterating over each char
      for (int i = 0; i < input.length(); i++)
      {
         //finding the currency tag
         beginPosition = input.indexOf("<Currency", temp);
         if( beginPosition != -1)
         {
            //finding the end of curncy block
            lastPosition = input.indexOf("</Currency>", beginPosition + 1);
            //finding the code element and taking code out from it
            code = input.substring(input.indexOf("Kod=", beginPosition) + 5, input.indexOf("Kod=", beginPosition) + 8);
            //getting the rate by looking for rate elemnts after begin block
            rate = input.substring(input.indexOf("<ForexBuying>", beginPosition) + 13, input.indexOf("<ForexBuying>", beginPosition) + 19);
            
            //adding the new currency element  to the list
            list.add( new Currency( code, Double.parseDouble(rate)));
            
            temp = lastPosition;
         }
      }
   }
}