package Lab03b;

import java.util.Iterator;
//interface that extends iterator but require nextInt to be implemented
public interface IntIterator extends Iterator
{
   int nextInt();
}