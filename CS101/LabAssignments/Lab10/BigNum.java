public class BigNum
{
  //public static finals
  public static final int BASE = 2;
  public static final int SIZE = 3;
  
  
  //properties
  private int[] num;
  
  
  //constructors
  public BigNum()
  {
    num = new int[SIZE];
    for (int count = 0; count < SIZE; count++)
    {
      num[count] = 0;
    }
  }
  
  public BigNum( String data)
  {
    int position;
    num = new int[SIZE];
    
    //Calculating valid values
    //valid = data.length();
    //Initializing to Zero
    for (int count = 0; count < SIZE; count++)
    {
      num[count] = 0;
    }
    
    //Adding the string to array
    position = 0;
    for (int count = data.length() - 1; count >= 0; count--)
    {
      num[position] = Integer.parseInt(data.substring(count, count + 1));
      position++;
    }
  }
  
  public BigNum( BigNum n1)
  {
    num = new int[SIZE];
    for (int count = 0; count < SIZE; count++)
    {
      this.num[count] = n1.num[count];
      //this.valid = n1.valid;
    }
  }
  
  //methods
  public void shift( boolean left)
  {
    if( left)
    {
      for (int count = SIZE - 2; count >= 0; count--)
      {
        this.num[count + 1] = this.num[count];
      }
      this.num[0] = 0;
    }
    else
    {
      for (int count = 1; count < SIZE; count++)
      {
        this.num[count - 1] = this.num[count];
      }
      this.num[SIZE - 1] = 0;
    }
  }
  
  public int add( BigNum other)
  {
    int carry;
    int sum;
    carry = 0;
    for (int count = 0; count < SIZE; count++)
    {
      sum = carry + this.num[count] + other.num[count];
      this.num[count] = (sum % BASE);
      carry = (sum - this.num[count]) / BASE;
    }

    return carry;
  }
  public boolean isLessThan( BigNum other)
  {
    return true;
  }
  
  public String toString()
  {
    String output;
    int i;
    int valid;
    output = "";
    
    //System.out.println(this.num);
    
    i = SIZE - 1;
    while(i >= 0 && this.num[i] == 0 && i > SIZE)
    {
      i--;
    }
    valid = i;
    
    //System.out.println("ccc");
    for (int count = valid; count >= 0; count--)
    {
      //System.out.println("Added");
      output = output + this.num[count];
    }
    return output;
  }

}