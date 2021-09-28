//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/bench/exp2x9.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var x1 : int;
var x2 : int;
var x3 : int;
var x4 : int;
var n : int;


procedure thread1() returns ()
modifies x1, x2, x3, x4, n;
{
  while (( x1 < n )) {
    x1 := ( x1 + x1 );
    x1 := ( x1 + x1 );
    x1 := ( x1 + x1 );
    x1 := ( x1 + x1 );
    x1 := ( x1 + x1 );
    x1 := ( x1 + x1 );
    x1 := ( x1 + x1 );
  }
}

procedure thread2() returns ()
modifies x1, x2, x3, x4, n;
{
  while (( x2 < n )) {
    x2 := ( x2 + x2 );
    x2 := ( x2 + x2 );
    x2 := ( x2 + x2 );
    x2 := ( x2 + x2 );
    x2 := ( x2 + x2 );
    x2 := ( x2 + x2 );
    x2 := ( x2 + x2 );
  }
}

procedure thread3() returns ()
modifies x1, x2, x3, x4, n;
{
  while (( x3 < n )) {
    x3 := ( x3 + x3 );
    x3 := ( x3 + x3 );
    x3 := ( x3 + x3 );
    x3 := ( x3 + x3 );
    x3 := ( x3 + x3 );
    x3 := ( x3 + x3 );
    x3 := ( x3 + x3 );
  }
}

procedure thread4() returns ()
modifies x1, x2, x3, x4, n;
{
  while (( x4 < n )) {
    x4 := ( x4 + x4 );
    x4 := ( x4 + x4 );
    x4 := ( x4 + x4 );
    x4 := ( x4 + x4 );
    x4 := ( x4 + x4 );
    x4 := ( x4 + x4 );
    x4 := ( x4 + x4 );
  }
}

procedure ULTIMATE.start() returns ()
modifies x1, x2, x3, x4, n;
{
  assume ( ( x1 == x2 ) && ( x1 > 0 ) && ( x3 == x4 ) && ( x3 > 0 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  fork 4,4,4,4 thread4();
  join 1;
  join 2,2;
  join 3,3,3;
  join 4,4,4,4;
  assume !( ( x1 == x2 ) && ( x3 == x4 ) );
  assert false; // should be unreachable
}
