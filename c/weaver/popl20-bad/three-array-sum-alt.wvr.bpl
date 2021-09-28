//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-bad/three-array-sum-alt.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var A : [int] int;
var C : [int] int;
var B : [int] int;
var asum : int;
var csum : int;
var i : int;
var k : int;
var N : int;
var j : int;
var bsum : int;


procedure thread1() returns ()
modifies A, C, B, asum, csum, i, k, N, j, bsum;
{
  while (( i < N )) {
    atomic {
      asum := ( asum + A[ i ] );
      i := ( i + 1 );
    }
  }
}

procedure thread2() returns ()
modifies A, C, B, asum, csum, i, k, N, j, bsum;
{
  while (( j < N )) {
    atomic {
      bsum := ( bsum + B[ j ] );
      j := ( j + 1 );
    }
  }
}

procedure thread3() returns ()
modifies A, C, B, asum, csum, i, k, N, j, bsum;
{
  while (( k < N )) {
    atomic {
      C[ k ] := ( A[ k ] + B[ k ] );
      csum := ( csum + C[ k ] );
      k := ( k + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies A, C, B, asum, csum, i, k, N, j, bsum;
{
  assume ( i == k && i == asum && i == bsum && i == j && i == csum && i == 0 );
  assume ( 0 <= N );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( csum == ( asum + bsum ) );
  assert false; // should be unreachable
}
