package Lab03a;
//the selectable interface
public interface Selectable
{
   
   boolean getSelected();
   
   void setSelected( boolean value);
   
   Shape contains( int x, int y);
}