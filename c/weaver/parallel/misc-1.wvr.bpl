//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/misc-1.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var A : [int] int;
var bag1 : int;
var bag2 : int;
var cap1 : int;
var cap2 : int;
var sum1 : int;
var sum2 : int;
var i : int;
var j : int;
var N : int;


procedure thread1() returns ()
modifies A, bag1, bag2, cap1, cap2, sum1, sum2, i, j, N;
{
  while (( i < N )) {
    if (( ( bag1 + A[i] ) < cap1 )) {
      bag1 := ( bag1 + A[i] );

    }
    else {
      sum1 := ( sum1 + bag1 );
      bag1 := A[i];

    }
    i := ( i + 1 );
  }
  sum1 := ( sum1 + bag1 );
}

procedure thread2() returns ()
modifies A, bag1, bag2, cap1, cap2, sum1, sum2, i, j, N;
{
  while (( j < N )) {
    if (( ( bag2 + A[j] ) < cap2 )) {
      bag2 := ( bag2 + A[j] );

    }
    else {
      sum2 := ( sum2 + bag2 );
      bag2 := A[j];

    }
    j := ( j + 1 );
  }
  sum2 := ( sum2 + bag2 );
}

procedure ULTIMATE.start() returns ()
modifies A, bag1, bag2, cap1, cap2, sum1, sum2, i, j, N;
{
  assume ( bag1 == bag2 && bag1 == sum1 && bag1 == sum2 && bag1 == i && bag1 == j && bag1 == 0 );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( sum1 == sum2 );
  assert false; // should be unreachable
}
