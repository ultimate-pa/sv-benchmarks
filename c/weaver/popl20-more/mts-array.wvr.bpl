//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-more/mts-array.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var mts1 : int;
var mts2 : int;
var mts3 : int;
var sum : int;
var i : int;
var j : int;
var k : int;
var N : int;
var M : int;
var A : [int] int;


procedure thread1() returns ()
modifies mts1, mts2, mts3, sum, i, j, k, N, M, A;
{
  while (( i < N )) {
    atomic {
      mts1 := ( if ( ( mts1 + A[ i ] ) < 0 ) then 0 else ( mts1 + A[ i ] ) );
      i := ( i + 1 );
    }
  }
}

procedure thread2() returns ()
modifies mts1, mts2, mts3, sum, i, j, k, N, M, A;
{
  while (( j < M )) {
    atomic {
      mts2 := ( if ( ( mts2 + A[ j ] ) < 0 ) then 0 else ( mts2 + A[ j ] ) );
      j := ( j + 1 );
    }
  }
}

procedure thread3() returns ()
modifies mts1, mts2, mts3, sum, i, j, k, N, M, A;
{
  while (( k < N )) {
    atomic {
      mts3 := ( if ( ( mts3 + A[ k ] ) < 0 ) then 0 else ( mts3 + A[ k ] ) );
      sum := ( sum + A[ k ] );
      k := ( k + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies mts1, mts2, mts3, sum, i, j, k, N, M, A;
{
  assume ( 0 <= M );
  assume ( M < N );
  assume ( i == j && i == mts1 && i == mts2 && i == mts3 && i == sum && i == 0 );
  assume ( k == M );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( mts1 == ( if ( mts3 < ( mts2 + sum ) ) then ( mts2 + sum ) else mts3 ) );
  assert false; // should be unreachable
}
