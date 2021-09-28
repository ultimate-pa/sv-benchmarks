//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/three-array-max.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var A : [int] int;
var C : [int] int;
var B : [int] int;
var maxa : int;
var maxb : int;
var maxc : int;
var p : int;
var i : int;
var k : int;
var l : int;
var N : int;


procedure thread1() returns ()
modifies A, C, B, maxa, maxb, maxc, p, i, k, l, N;
{
  while (( i < N )) {
    atomic {
      maxa := ( if ( maxa > A[ i ] ) then maxa else A[ i ] );
      maxb := ( if ( maxb > B[ i ] ) then maxb else B[ i ] );
      i := ( i + 1 );
    }
  }
}

procedure thread2() returns ()
modifies A, C, B, maxa, maxb, maxc, p, i, k, l, N;
{
  while (( k < N )) {
    atomic {
      C[ k ] := ( A[ k ] + B[ k ] );
      k := ( k + 1 );
      p := k;
    }
  }
}

procedure thread3() returns ()
modifies A, C, B, maxa, maxb, maxc, p, i, k, l, N;
{
  while (( l < N )) {
    if (( l < p )) {
      atomic {
        maxc := ( if ( maxc > C[ l ] ) then maxc else C[ l ] );
        l := ( l + 1 );
      }

    }
  }
}

procedure ULTIMATE.start() returns ()
modifies A, C, B, maxa, maxb, maxc, p, i, k, l, N;
{
  assume ( i == k && i == l && i == p && i == 1 );
  assume ( 0 <= N );
  assume ( maxa == A[ 0 ] );
  assume ( maxb == B[ 0 ] );
  assume ( maxc == ( A[ 0 ] + B[ 0 ] ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( maxc <= ( maxa + maxb ) );
  assert false; // should be unreachable
}
