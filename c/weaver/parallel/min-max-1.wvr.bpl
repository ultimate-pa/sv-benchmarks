//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/min-max-1.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var A : [int] int;
var min : int;
var max : int;
var i : int;
var j : int;
var N : int;
var v_assert : bool;
var b1 : bool;
var b2 : bool;


procedure thread1() returns ()
modifies A, min, max, i, j, N, v_assert, b1, b2;
{
  min := A[0];
  b1 := true;
  while (( ( 0 < i ) && ( i < N ) )) {
    min := ( if ( min < A[i] ) then min else A[i] );
    i := ( i + 1 );
  }
}

procedure thread2() returns ()
modifies A, min, max, i, j, N, v_assert, b1, b2;
{
  max := A[0];
  b2 := true;
  while (( ( 0 < j ) && ( j < N ) )) {
    max := ( if ( max > A[j] ) then max else A[j] );
    j := ( j + 1 );
  }
}

procedure thread3() returns ()
modifies A, min, max, i, j, N, v_assert, b1, b2;
{
  v_assert := ( b1 ==> b2 ==> ( min <= max ) );
}

procedure ULTIMATE.start() returns ()
modifies A, min, max, i, j, N, v_assert, b1, b2;
{
  assume ( ( i == j && i == 0 ) && ( min == max && min == A[0] ) && ( v_assert == b1 && v_assert == b2 && v_assert == false ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !v_assert;
  assert false; // should be unreachable
}
