//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/simple-equiv.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var x_0 : int;
var x_1 : int;
var temp_2 : int;


procedure thread1() returns ()
modifies x_0, x_1, temp_2;
{
  x_0 := ( x_0 + 1 );
}

procedure thread2() returns ()
modifies x_0, x_1, temp_2;
{
  x_0 := ( x_0 + 1 );
}

procedure thread3() returns ()
modifies x_0, x_1, temp_2;
{
  temp_2 := x_1;
  x_1 := ( temp_2 + 1 );
  temp_2 := x_1;
  x_1 := ( temp_2 + 1 );
}

procedure ULTIMATE.start() returns ()
modifies x_0, x_1, temp_2;
{
  assume ( x_0 == x_1 );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( x_0 == x_1 );
  assert false; // should be unreachable
}
