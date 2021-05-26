import cs102.ds.*;
import java.util.Scanner;
public class Lab07b{
   public static void main( String[] args){
      Scanner scan = new Scanner( System.in);
      
      Stack data = new Stack();
      String expression;
      
      System.out.print( "Enter expression: ");
      expression = scan.nextLine();
      
      for( int i = 0; i < expression.length(); i++){
         if( Character.isDigit( expression.charAt( i))){
            data.push( expression.charAt( i) + "");
         }
         else if( expression.charAt( i) == '+'){
            int firstValue = Integer.parseInt( data.pop());
            int secondValue = Integer.parseInt( data.pop());
            int output = firstValue + secondValue;
            data.push( output + "");
         }
         else if( expression.charAt( i) == '-'){
            int firstValue = Integer.parseInt( data.pop());
            int secondValue = Integer.parseInt( data.pop());
            int output = secondValue - firstValue;
            data.push( output + "");
         }
         else if( expression.charAt( i) == '*'){
            int firstValue = Integer.parseInt( data.pop());
            int secondValue = Integer.parseInt( data.pop());
            int output = firstValue * secondValue;
            data.push( output + "");
         }
         else if( expression.charAt( i) == '/'){
            int firstValue = Integer.parseInt( data.pop());
            int secondValue = Integer.parseInt( data.pop());
            int output = secondValue / firstValue;
            data.push( output + "");
         }
      }
      System.out.println( data.pop());
      
   
   }
}