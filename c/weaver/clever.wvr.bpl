//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/clever.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var n : int;
var m : int;
var i1 : int;
var i2 : int;
var j1 : int;
var k1 : int;
var k2 : int;


procedure thread1() returns ()
modifies n, m, i1, i2, j1, k1, k2;
{
  while (( i1 < n )) {
    j1 := 0;
    while (( j1 < m )) {
      k1 := ( k1 + 1 );
      j1 := ( j1 + 1 );
    }
    i1 := ( i1 + 1 );
  }
}

procedure thread2() returns ()
modifies n, m, i1, i2, j1, k1, k2;
{
  while (( i2 < n )) {
    k2 := ( k2 + m );
    i2 := ( i2 + 1 );
  }
}

procedure ULTIMATE.start() returns ()
modifies n, m, i1, i2, j1, k1, k2;
{
  assume ( i1 == i2 && i1 == k1 && i1 == k2 && i1 == 0 );
  assume ( m >= 0 );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( k1 == k2 );
  assert false; // should be unreachable
}
