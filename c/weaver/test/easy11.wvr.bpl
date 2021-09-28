//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/test/easy11.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var X : int;
var Y : int;


procedure thread1() returns ()
modifies X, Y;
{
  var x : int;
  assume ( x == X );
  while (( x < 10000 )) {
    x := ( x + 1 );
  }
  Y := ( Y + x );
}

procedure thread2() returns ()
modifies X, Y;
{
  var x : int;
  assume ( x == X );
  while (( x < 10000 )) {
    x := ( x + 1 );
  }
  Y := ( Y + x );
}

procedure ULTIMATE.start() returns ()
modifies X, Y;
{
  assume ( ( X <= 10000 ) && ( Y == 0 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( Y == 20000 );
  assert false; // should be unreachable
}
