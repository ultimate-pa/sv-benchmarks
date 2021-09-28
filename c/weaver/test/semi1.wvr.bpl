//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/test/semi1.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var x : int;
var y : int;


procedure thread1() returns ()
modifies x, y;
{
  x := ( x + 1 );
}

procedure thread2() returns ()
modifies x, y;
{
  atomic {
    assume ( x >= 0 );
    x := ( x - 1 );
  }
}

procedure ULTIMATE.start() returns ()
modifies x, y;
{
  assume ( x == y );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( x == y );
  assert false; // should be unreachable
}
