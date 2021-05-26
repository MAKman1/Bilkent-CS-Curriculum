package shapes;
//the selectable interface
public interface Selectable
{
   
   boolean getSelected();
   
   void setSelected( boolean value);
   
   Shape containsPoint( int x, int y);
}