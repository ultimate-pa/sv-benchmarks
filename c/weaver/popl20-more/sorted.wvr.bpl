//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-more/sorted.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var i : int;
var j : int;
var k : int;
var N : int;
var M : int;
var sorted1 : bool;
var sorted2 : bool;
var sorted3 : bool;
var A : [int] int;


procedure thread1() returns ()
modifies i, j, k, N, M, sorted1, sorted2, sorted3, A;
{
  while (( i < ( N - 1 ) )) {
    atomic {
      sorted1 := ( sorted1 && ( A[i] < A[( i + 1 )] ) );
      i := ( i + 1 );
    }
  }
}

procedure thread2() returns ()
modifies i, j, k, N, M, sorted1, sorted2, sorted3, A;
{
  while (( j < M )) {
    atomic {
      sorted2 := ( sorted2 && ( A[j] < A[( j + 1 )] ) );
      j := ( j + 1 );
    }
  }
}

procedure thread3() returns ()
modifies i, j, k, N, M, sorted1, sorted2, sorted3, A;
{
  while (( k < ( N - 1 ) )) {
    atomic {
      sorted3 := ( sorted3 && ( A[k] < A[( k + 1 )] ) );
      k := ( k + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies i, j, k, N, M, sorted1, sorted2, sorted3, A;
{
  assume ( 0 <= M );
  assume ( M < N );
  assume ( i == j && i == 0 );
  assume ( k == M );
  assume sorted1;
  assume sorted2;
  assume sorted3;
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( sorted1 == ( sorted2 && sorted3 ) );
  assert false; // should be unreachable
}
