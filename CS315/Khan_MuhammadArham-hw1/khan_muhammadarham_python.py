#global variable declaration
x = "global"
y = "global"

def main():
  x = "main"
  
  #should output the variable defined in scope of main()
  print("x in main: " + x)
  #should output the y defined in global scope
  print("y in main: " + y)

  def foo1():
    #editing x variable in parent
    nonlocal x
    x = "main->foo1"
    
    #y variable is global y
    global y
    
    print("x in foo1: " + x)
    print("y in foo1: " + y)
    
    #edits y in parent scope (ie: global)
    y = "global->foo1"
  
  foo2()
  foo1()
  
  #should output the edited x defined in scope of main()
  print("x in main2: " + x)
  
  foo2()
  
  
def foo2():
  #since static scoping, global y printed
  #local x printed
  x = "foo2"
  print("x in foo2: " + x)
  print("y in foo2: " + y)
  
def foo3():
  print("i in loop: ", end="")
  for i in range (3):
    #i is accessible inside block
    a = i
    print( str(i) + ',', end="")
  print()
  #i accessible
  print("i outside loop block in foo3: " + str(i));
  #a accessible outside block
  print("a outside loop block in foo3: " + str(a));
  
  
main()
print()
foo3()
  