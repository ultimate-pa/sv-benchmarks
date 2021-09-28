//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/simple-array-sum.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var A : [int] int;
var C : [int] int;
var asum : int;
var csum : int;
var p : int;
var i : int;
var k : int;
var l : int;
var N : int;


procedure thread1() returns ()
modifies A, C, asum, csum, p, i, k, l, N;
{
  while (( i < N )) {
    atomic {
      asum := ( asum + A[ i ] );
      i := ( i + 1 );
    }
  }
}

procedure thread2() returns ()
modifies A, C, asum, csum, p, i, k, l, N;
{
  while (( k < N )) {
    atomic {
      C[ k ] := ( A[ k ] + 1 );
      k := ( k + 1 );
      p := k;
    }
  }
}

procedure thread3() returns ()
modifies A, C, asum, csum, p, i, k, l, N;
{
  while (( l < N )) {
    if (( l < p )) {
      atomic {
        csum := ( csum + C[ l ] );
        l := ( l + 1 );
      }

    }
  }
}

procedure ULTIMATE.start() returns ()
modifies A, C, asum, csum, p, i, k, l, N;
{
  assume ( i == k && i == l && i == p && i == asum && i == csum && i == 0 );
  assume ( 0 <= N );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( csum == ( asum + N ) );
  assert false; // should be unreachable
}
