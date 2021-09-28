//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/three-array-min.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var A : [int] int;
var C : [int] int;
var B : [int] int;
var mina : int;
var minb : int;
var minc : int;
var p : int;
var i : int;
var k : int;
var l : int;
var N : int;


procedure thread1() returns ()
modifies A, C, B, mina, minb, minc, p, i, k, l, N;
{
  while (( i < N )) {
    atomic {
      mina := ( if ( mina < A[ i ] ) then mina else A[ i ] );
      minb := ( if ( minb < B[ i ] ) then minb else B[ i ] );
      i := ( i + 1 );
    }
  }
}

procedure thread2() returns ()
modifies A, C, B, mina, minb, minc, p, i, k, l, N;
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
modifies A, C, B, mina, minb, minc, p, i, k, l, N;
{
  while (( l < N )) {
    if (( l < p )) {
      atomic {
        minc := ( if ( minc < C[ l ] ) then minc else C[ l ] );
        l := ( l + 1 );
      }

    }
  }
}

procedure ULTIMATE.start() returns ()
modifies A, C, B, mina, minb, minc, p, i, k, l, N;
{
  assume ( i == k && i == l && i == p && i == 1 );
  assume ( 0 <= N );
  assume ( mina == A[ 0 ] );
  assume ( minb == B[ 0 ] );
  assume ( minc == ( A[ 0 ] + B[ 0 ] ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( minc >= ( mina + minb ) );
  assert false; // should be unreachable
}
