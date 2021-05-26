//global variable declaration
String x = "global";
String y = "global";

void main(){
  String x = "main";
  //should output the variable defined in scope of main()
  print("x in main: " + x);
  //should output the y defined in global scope
  print("y in main: " + y);
  
  void foo1(){
    //editing x variable in parent
    x = "main->foo1";
      
    print("x in foo1: " + x);
    print("y in foo1: " + y);
      
    //edits y in parent scope (ie: global)
    y = "global->foo1";
  }
  foo2();
  foo1();
  //should output the edited x defined in scope of main()
  print("x in main2: " + x);
  foo2();
  
  foo3();
}

void foo2(){
  //since static scoping, global y printed
  //local x printed
  String x = "foo2";
  print("x in foo2: " + x);
  print("y in foo2: " + y);
}

void foo3(){
  print("i in loop: ");
  for(var i = 0; i < 3; i++){
    //i is accessible inside block
    var a = i;
    print( i.toString() + ",");
  }
  //i inaccessible
  //print("i outside loop block in foo3: " + i);
  //a inaccessible outside block
  //print("a outside loop block in foo3: " + a);
}
