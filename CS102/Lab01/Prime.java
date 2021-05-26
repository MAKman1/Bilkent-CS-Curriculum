public class Prime
{
  //properties
  IntBag data;
  
  //constructors
  public Prime()
  {
    data = new IntBag();
    data.add(2);
  }
  //methods
  public void generate()
  {
    boolean added;
    boolean prime;
    int value;
    
    value = 3;
    do
    {
      prime = true;
      for(int i = 0; i < data.size(); i++)
      {
        if( value % data.get(i) == 0)
          prime = false;
      }
      added = true;
      if( prime)
        added = data.add(value);
      value++;
    } while( added);
  }
  
  public String toString()
  {
    return data.toString();
  }
  
}