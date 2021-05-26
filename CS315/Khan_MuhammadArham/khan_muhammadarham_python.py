
def test1( a, b, c):
  print( "test1: a=" + a + ", b=" + b + ", c=" + c)
  
def test2( a = 'defaultA', b = 'defaultB', c = 'defaultC'):
  print( "test2: a=" + a + ", b=" + b + ", c=" + c)

def test3( *args):
  print("test3: ", args)
  
def test4( a):
  a = "test4A"
  print( "test4: a=" + a)
  
def test5( a):
  a.val = "test5A"
  print( "test4: a=", a.val)
  

def main():
  #showing positional correspondence
  test1( "a", "b", "c");
  
  print()
  #showing keyword correspondence
  test1( b = "b", a = "a", c = "c")
  test1( c = "c", b = "b", a = "a")
  test1( a = "a", b = "b", c = "c")
  
  print()
  #combination of positional and keyword combination
  #_____________________________________________
  #  non-keyword argument after a keyword argument
  #test1( b = "b", a = "a", "c")
  #  duplicate value for the same argument
  #test1( b = "b", "b", "c")
  
  test1( "a", b = "b", c = "c")
  test1( "a", c = "c", b = "b")
  
  print()
  
  #Formal Parameter Default Values
  test2( "a", "b", "c")
  test2( "a", "b")
  test2( "a", c = "c")
  test2()
  
  print()
  #Variable Number of Actual Parameters
  #____________________________________
  #less than actual number of parameters
  #test1("a", "b") #gives error
  
  #more than actual parameters
  #test1("a", "b", "c", "d") #gives error
  
  test3("a", "b");
  test3("a", "b", "c", "d")
  
  print()
  a = "mainA"
  b = TestParam("b")
  
  #parameters are passed by value by default in python
  test4( a)
  test5( b)
  #to pass by reference, a wrapper class must be made
  #as only objects are passed by reference
  #so main parameters not changed
  print("main: a=" + a + ", b=" + b.val)
  
class TestParam:
  def __init__(self, val):
    self.val = val 
  
  
  
main()
  