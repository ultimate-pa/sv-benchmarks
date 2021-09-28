//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-more/parray-copy.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var i : int;
var j : int;
var k : int;
var l : int;
var N : int;
var M : int;
var A : [int] int;
var B : [int] int;


procedure thread1() returns ()
modifies i, j, k, l, N, M, A, B;
{
  while (( i < N )) {
    atomic {
      B[ i ] := A[ i ];
      i := ( i + 1 );
    }
  }
}

procedure thread2() returns ()
modifies i, j, k, l, N, M, A, B;
{
  while (( j < M )) {
    atomic {
      B[ j ] := A[ j ];
      j := ( j + 1 );
    }
  }
}

procedure thread3() returns ()
modifies i, j, k, l, N, M, A, B;
{
  while (( k < N )) {
    atomic {
      B[ k ] := A[ k ];
      k := ( k + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies i, j, k, l, N, M, A, B;
{
  assume ( 0 <= M );
  assume ( M < N );
  assume ( i == j && i == 0 );
  assume ( k == M );
  assume ( 0 <= l );
  assume ( l < N );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( A[ l ] == B[ l ] );
  assert false; // should be unreachable
}
