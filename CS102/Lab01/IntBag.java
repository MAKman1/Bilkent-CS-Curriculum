

public class IntBag
{
  //finals
  private final int SIZE;
  //properties
  int[] bag;
  int valid;
  
  
  //contructors
  public IntBag()
  {
    SIZE = 100;
    bag = new int[SIZE];
    valid = 0;
  }
  
  public IntBag( int elements)
  {
    SIZE = elements;
    bag = new int[SIZE];
    valid = 0;
  }
  //methods
  
  public boolean add(int value)
  {
    if (valid >= SIZE)
      return false;
    bag[valid] = value;
    valid++;
    return true;
  }
  
  public boolean add(int value, int position)
  {
    if (valid >= SIZE)
      return false;
    for (int i = valid; i > position; i--)
    {
      bag[i] = bag[i- 1];
    }
    bag[position] = value;
    valid++;
    return true;
  }
  
  public void remove(int position)
  {
    for( int i = position; i < valid - 1; i++)
    {
      bag[i] = bag[i + 1];
    }
    valid--;
  }
  
  public boolean contains( int value)
  {
    for (int i = 0; i < valid; i++)
    {
      if( bag[i] == value)
        return true;
    }
    return false;
  }
  public String toString()
  {
    String output;
    output = "[";
    for (int i = 0; i < valid - 1; i++)
    {
      output = output + bag[i] + ", ";
    }
    output = output + bag[valid - 1] + "]";
    return output;
  }
  
  public int size()
  {
    return valid;
  }
  
  public int get(int position)
  {
    return bag[position];
  }
}