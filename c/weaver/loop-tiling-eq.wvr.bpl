//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/loop-tiling-eq.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var x : int;
var i : int;
var j : int;
var L : int;
var N : int;
var M : int;
var a : int;
var b : int;
var A : [int] int;
var F : [int] int;
var B : [int] [int] int;


procedure thread1() returns ()
modifies x, i, j, L, N, M, a, b, A, F, B;
{
  x := 0;
  while (*) {
    atomic {
      assume ( x < L );
      A[ x ] := F[ x ];
      x := ( x + 1 );
    }
  }
  assume !( x < L );
}

procedure thread2() returns ()
modifies x, i, j, L, N, M, a, b, A, F, B;
{
  i := 0;
  while (*) {
    atomic {
      assume ( i < N );
      j := 0;
    }
    while (*) {
      atomic {
        assume ( j < M );
        B[ i ] := ( B[ i ][ j := F[ ( ( i * M ) + j ) ] ] );
        j := ( j + 1 );
      }
    }
    atomic {
      assume !( j < M );
      i := ( i + 1 );
    }
  }
  assume !( i < N );
}

procedure ULTIMATE.start() returns ()
modifies x, i, j, L, N, M, a, b, A, F, B;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( 0 <= a ) ==> ( a < N ) ==> ( 0 <= b ) ==> ( b < M ) ==> ( L == ( N * M ) ) ==> ( A[ ( ( a * M ) + b ) ] == B[ a ][ b ] ) );
  assert false; // should be unreachable
}
