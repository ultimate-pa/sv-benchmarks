//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/spaghetti.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var x_0 : int;
var x_1 : int;


procedure thread1() returns ()
modifies x_0, x_1;
{
  while (*) {
    havoc x_0;
    x_0 := ( x_0 + 3 );
    x_0 := ( 2 * x_0 );
  }
  x_0 := 0;
}

procedure thread2() returns ()
modifies x_0, x_1;
{
  while (*) {
    x_0 := ( x_0 * 10 );
    x_0 := ( x_0 + x_0 );
  }
  x_0 := 0;
}

procedure thread3() returns ()
modifies x_0, x_1;
{
  while (*) {
    havoc x_1;
    x_1 := ( x_1 + 3 );
    x_1 := ( 2 * x_1 );
  }
  x_1 := 0;
}

procedure thread4() returns ()
modifies x_0, x_1;
{
  while (*) {
    x_1 := ( x_1 * 10 );
    x_1 := ( x_1 + x_1 );
  }
  x_1 := 0;
}

procedure ULTIMATE.start() returns ()
modifies x_0, x_1;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  fork 4,4,4,4 thread4();
  join 1;
  join 2,2;
  join 3,3,3;
  join 4,4,4,4;
  assume !( x_0 == x_1 );
  assert false; // should be unreachable
}
