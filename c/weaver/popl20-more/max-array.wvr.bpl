//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-more/max-array.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var max1 : int;
var max2 : int;
var i : int;
var j : int;
var k : int;
var N : int;
var M : int;
var A : [int] int;


procedure thread1() returns ()
modifies max1, max2, i, j, k, N, M, A;
{
  while (( i < N )) {
    atomic {
      max1 := ( if ( max1 < A[ i ] ) then A[ i ] else max1 );
      i := ( i + 1 );
    }
  }
}

procedure thread2() returns ()
modifies max1, max2, i, j, k, N, M, A;
{
  while (( j < M )) {
    atomic {
      max2 := ( if ( max2 < A[ j ] ) then A[ j ] else max2 );
      j := ( j + 1 );
    }
  }
}

procedure thread3() returns ()
modifies max1, max2, i, j, k, N, M, A;
{
  while (( k < N )) {
    atomic {
      max2 := ( if ( max2 < A[ k ] ) then A[ k ] else max2 );
      k := ( k + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies max1, max2, i, j, k, N, M, A;
{
  assume ( 0 <= M );
  assume ( M < N );
  assume ( i == j && i == max1 && i == max2 && i == 0 );
  assume ( k == M );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( max1 == max2 );
  assert false; // should be unreachable
}
