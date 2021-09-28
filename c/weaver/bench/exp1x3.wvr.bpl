//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/bench/exp1x3.wvr'.
*
* Generated: 2021-02-25T09:33:21.
*/
var x1 : int;
var x2 : int;
var n : int;


procedure thread1() returns ()
modifies x1, x2, n;
{
  while (( x1 < n )) {
    x1 := ( x1 + x1 );
  }
}

procedure thread2() returns ()
modifies x1, x2, n;
{
  while (( x2 < n )) {
    x2 := ( x2 + x2 );
  }
}

procedure ULTIMATE.start() returns ()
modifies x1, x2, n;
{
  assume ( ( x1 == x2 ) && ( x1 > 0 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( x1 == x2 );
  assert false; // should be unreachable
}
