#global variable declaration
$x = "global";
$y = "global";

sub main(){
  my $x = "main";
  
  #should output the variable defined in scope of main()
  print "x in main: $x\n";
  #should output the y defined in global scope
  print "y in main: $y\n";
  
  foo2();
  foo1();
  
  #should output the edited x defined in scope of main()
  print "x in main2: $x\n";
  foo2();
  
}

sub foo2(){
  #since dynamic scoping, y from global printed  
  my $x = "foo2";
  print "x in foo2: $x\n";
  print "y in foo2: $y\n";
  
  sub foo1(){
    #editing x variable in static parent (ie: foo2)
    $x = "main->foo1";
    
    #x referenced from foo2 because static scoping
    #y referenced from global (main's parent scope)
    print "x in foo1: $x\n";
    print "y in foo1: $y\n";
    #edits y in parent scope (ie: global)
    $y = "global->foo1";
  }
}

sub foo3(){
  print "i in loop: ";
  for( $i = 0; $i < 3; $i++){
    #i is accessible inside block
    my $a = $i;
    print "$i,";
  }
    
  print "\n";
  #i inaccessible
  print "i outside loop block in foo3: $i\n";
  #a inaccessible outside block
  print "a outside loop block in foo3: $a\n";
}

main();
print "\n";
foo3();