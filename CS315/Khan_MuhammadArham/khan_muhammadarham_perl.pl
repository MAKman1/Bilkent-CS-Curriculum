sub test1{
  my ($a, $b, $c) = @_;
  print "test1: a=" . $a . ", b=" . $b . ", c=" . $c . "\n";
}

#test1_1 allows for keyword correspondence
sub test1_1{
  %vals = @_;
  my ($a, $b, $c) = ($vals{a}, $vals{b}, $vals{c});
  print "test1: a=" . $a . ", b=" . $b . ", c=" . $c . "\n";
}
#allows combinational correspondence
sub test1_2{
  ($a, %vals) = @_;
  my ( $b, $c) = ( $vals{b}, $vals{c});
  print "test1: a=" . $a . ", b=" . $b . ", c=" . $c . "\n";
}

#adds default values to parameters
sub test2{
  %vals = (
    'a' => 'defaultA',
    'b' => 'defaultB',
    'c' => 'defaultC',
    @_
  );
  my ($a, $b, $c) = ($vals{a}, $vals{b}, $vals{c});
  print "test2: a=" . $a . ", b=" . $b . ", c=" . $c . "\n";
}

#can input variable number of parameters
sub test3{
  print "test3: ";
  for( @_){
    print  $_ . ",";
  }
  print "\n";
}

#simulates pass-by-value
sub test4{
  #assigning variable to another variable to copy
  my ($a) = @_;
  $a = "test4A";
  print "test4: a=" . $a . "\n";
}

#edits variable in static parent because passed
#by reference
sub test5{
  @_[0] = "test5A";
  print "test5: a=" . @_[0] . "\n";
}

sub main(){
  #showing positional correspondence
  test1( "a", "b", "c");
  
  print "\n";
  #showing keyword correspondence
  test1_1( b => "b", a => "a", c => "c");
  test1_1( c => "c", b => "b", a => "a");
  test1_1( a => "a", b => "b", c => "c");
  
  print "\n";
  #combination of positional and keyword combination
  #_____________________________________________
  #  not allowed: leaves elements without keyword assignment as null
  test1_1( b => "b", a => "a", "c");
  test1_1( b => "b", "b", "c");
  
  #allows combinational correspondence
  # a is passed by position, b and c are passed by keywords
  test1_2( "a", b => "b", c => "c");
  test1_2( "a", c => "c", b => "b");
  
  print "\n";
  
  #Formal Parameter Default Values
  #Default assignment only works on 
  #keyword correspondence
  test2( a => "a", b => "b");
  test2( a => "a");
  test2( b => "b", c => "c");
  test2();
  
  
  print "\n";
  #Variable Number of Actual Parameters
  #____________________________________
  #allowed, but unassigned parameters are null
  test1("a", "b");
  #allowed, but extra parameters are ignored
  test1("a", "b", "c", "d");
  
  test3("a", "b");
  test3("a", "b", "c", "d");
  
  
  print "\n";
  $a = "mainA";
  $b = "mainB";
  
  #parameters are passed by reference by default in python
  test4( $a);
  test5( $b);
  #to pass by value, the passed parameter cannot be used
  #in the subroutine as it is passed by reference
  print "main: a=" . $a . ", b=" . $b . "\n";
  
}

main();