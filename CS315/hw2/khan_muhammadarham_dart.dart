
void test1( String a, String b, String c){
  print( "test1: a=" + a + ", b=" + b + ", c=" + c);
}

//enables keyword, combinational correspondence
void test1_1( {String a, String b, String c}){
  print( "test1: a=" + a + ", b=" + b + ", c=" + c);
}

//allows combinational correspondence (a can be positional and b and c can be keywords)
void test1_2( String a, {String b, String c}){
  print( "test1: a=" + a + ", b=" + b + ", c=" + c);
}

//gives default values to all parameters
void test2( {String a : "defaultA", String b : "defaultB", String c : "defaultC"}){
  print( "test2: a=" + a + ", b=" + b + ", c=" + c);
}

//No test3 function available as variable number of parameters not allowed

//test4 tests pass by value
void test4( String a){
    a = "test4A";
    print( "test4: a=" + a);
}

//test5 tests pass by reference
void test5( TestParam a){
    a.val = "test5A";
    print( "test4: a="+ a.val);
}




void main(){
  //showing positional correspondence
  test1( "a", "b", "c");
  
  print("\n");
  //showing keyword correspondence
  test1_1( b : "b", a : "a", c : "c");
  test1_1( c : "c", b : "b", a : "a");
  test1_1( a : "a", b : "b", c : "c");
  
  print("\n");
  //combination of positional and keyword combination
  //_____________________________________________
  // error: named argument expected
  //test1_1( b : "b", a : "a", "c")
  //  error: named argument expected
  //test1_1( "a", b : "b", c: "c")
  
  test1_2( "a", b : "b", c : "c");
  test1_2( "a", c : "c", b : "b");
  
  print("\n");
  
  //Formal Parameter Default Values
  test2( a: "a", b : "b", c :"c");
  test2( a : "a", b : "b");
  test2( a: "a", c : "c");
  test2();
  
  print("\n");
  //Variable Number of Actual Parameters
  //____________________________________
  //less than or greater than actual number of parameters
  //gives error: incorrect number of arguments passed
  //variable number of arguments not possible
  //test1("a", "b");
  //test1("a", "b", "c", "d");
  
  
  print("\n");
  String a = "mainA";
  TestParam b = new TestParam("b");
  
  //parameters are passed by value by default
  test4( a);
  test5( b);
  //to pass by reference, a wrapper class must be made
  //as only objects are passed by reference
  //so main parameters not changed
  print("main: a=" + a + ", b=" + b.val);
}

class TestParam {
  String val;
  TestParam(this.val);
}
