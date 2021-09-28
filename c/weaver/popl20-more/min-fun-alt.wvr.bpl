//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-more/min-fun-alt.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var min1 : int;
var min2 : int;
var i : int;
var j : int;
var k : int;
var N : int;
var M : int;
var A : [int] int;


procedure thread1() returns ()
modifies min1, min2, i, j, k, N, M, A;
{
  while (( i < N )) {
    atomic {
      min1 := ( if ( min1 > A[i] ) then A[i] else min1 );
      i := ( i + 1 );
    }
  }
}

procedure thread2() returns ()
modifies min1, min2, i, j, k, N, M, A;
{
  while (( j < M )) {
    atomic {
      min2 := ( if ( min2 > A[j] ) then A[j] else min2 );
      j := ( j + 1 );
    }
  }
}

procedure thread3() returns ()
modifies min1, min2, i, j, k, N, M, A;
{
  while (( k < N )) {
    atomic {
      min2 := ( if ( min2 > A[k] ) then A[k] else min2 );
      k := ( k + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies min1, min2, i, j, k, N, M, A;
{
  assume ( 0 <= M );
  assume ( M < N );
  assume ( i == j && i == min1 && i == min2 && i == 0 );
  assume ( k == M );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( min1 == min2 );
  assert false; // should be unreachable
}
