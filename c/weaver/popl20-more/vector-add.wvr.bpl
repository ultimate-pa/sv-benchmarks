//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-more/vector-add.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var i : int;
var j : int;
var k : int;
var N : int;
var M : int;
var A : [int] int;
var B : [int] int;
var C1 : [int] int;
var C2 : [int] int;


procedure thread1() returns ()
modifies i, j, k, N, M, A, B, C1, C2;
{
  while (( i < N )) {
    atomic {
      C1[ i ] := ( A[i] + B[i] );
      i := ( i + 1 );
    }
  }
}

procedure thread2() returns ()
modifies i, j, k, N, M, A, B, C1, C2;
{
  while (( j < M )) {
    atomic {
      C2[ j ] := ( A[j] + B[j] );
      j := ( j + 1 );
    }
  }
}

procedure thread3() returns ()
modifies i, j, k, N, M, A, B, C1, C2;
{
  while (( k < N )) {
    atomic {
      C2[ k ] := ( A[k] + B[k] );
      k := ( k + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies i, j, k, N, M, A, B, C1, C2;
{
  assume ( 0 <= M );
  assume ( M < N );
  assume ( i == j && i == 0 );
  assume ( k == M );
  assume ( C1 == C2 );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( C1 == C2 );
  assert false; // should be unreachable
}
