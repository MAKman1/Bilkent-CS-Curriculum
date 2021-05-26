public class Currency
{
   //Variables
   String currencyCode;
   double rate;
   
   
   //inITIALIZE currency
   public Currency(String currencyCode, double rate)
   {
      this.currencyCode = currencyCode;
      this.rate = rate;
   }
   //return the currency code
   public String getCode()
   {
      return this.currencyCode;
   }
   
   //return the rate
   public double getRate()
   {
      return this.rate;
   }
   //ater the rate
   public void modifyRate(double newRate)
   {
      this.rate = newRate;
   }
}