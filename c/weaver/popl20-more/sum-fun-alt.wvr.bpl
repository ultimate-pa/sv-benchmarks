//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-more/sum-fun-alt.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var sum1 : int;
var sum2 : int;
var i : int;
var j : int;
var k : int;
var N : int;
var M : int;
var A : [int] int;


procedure thread1() returns ()
modifies sum1, sum2, i, j, k, N, M, A;
{
  while (( i < N )) {
    atomic {
      sum1 := ( sum1 + A[i] );
      i := ( i + 1 );
    }
  }
}

procedure thread2() returns ()
modifies sum1, sum2, i, j, k, N, M, A;
{
  while (( j < M )) {
    atomic {
      sum2 := ( sum2 + A[j] );
      j := ( j + 1 );
    }
  }
}

procedure thread3() returns ()
modifies sum1, sum2, i, j, k, N, M, A;
{
  while (( k < N )) {
    atomic {
      sum2 := ( sum2 + A[k] );
      k := ( k + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies sum1, sum2, i, j, k, N, M, A;
{
  assume ( 0 <= M );
  assume ( M < N );
  assume ( i == j && i == sum1 && i == sum2 && i == 0 );
  assume ( k == M );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( sum1 == sum2 );
  assert false; // should be unreachable
}
