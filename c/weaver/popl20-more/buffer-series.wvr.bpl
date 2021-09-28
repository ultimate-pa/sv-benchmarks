//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-more/buffer-series.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var i : int;
var j : int;
var total : int;
var N : int;
var q1 : [int] int;
var q2 : [int] int;
var f : [int] int;
var q1_front : int;
var q1_back : int;
var q2_front : int;
var q2_back : int;


procedure thread1() returns ()
modifies i, j, total, N, q1, q2, f, q1_front, q1_back, q2_front, q2_back;
{
  while (( i < N )) {
    atomic {
      assume ( q1[q1_back] == f[i] );
      q1_back := ( q1_back + 1 );
    }
    i := ( i + 1 );
  }
}

procedure thread2() returns ()
modifies i, j, total, N, q1, q2, f, q1_front, q1_back, q2_front, q2_back;
{
  while (( j < N )) {
    atomic {
      assume ( q2[q2_back] == ( - f[j] ) );
      q2_back := ( q2_back + 1 );
    }
    j := ( j + 1 );
  }
}

procedure thread3() returns ()
modifies i, j, total, N, q1, q2, f, q1_front, q1_back, q2_front, q2_back;
{
  while (( ( i < N ) || ( q1_front < q1_back ) )) {
    atomic {
      assume ( q1_front < q1_back );
      total := ( total + q1[q1_front] );
      q1_front := ( q1_front + 1 );
    }
  }
}

procedure thread4() returns ()
modifies i, j, total, N, q1, q2, f, q1_front, q1_back, q2_front, q2_back;
{
  while (( ( j < N ) || ( q2_front < q2_back ) )) {
    atomic {
      assume ( q2_front < q2_back );
      total := ( total + q2[q2_front] );
      q2_front := ( q2_front + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies i, j, total, N, q1, q2, f, q1_front, q1_back, q2_front, q2_back;
{
  assume ( ( N >= 0 ) && ( q1_front == q1_back ) && ( q2_front == q2_back ) && ( total == 0 ) && ( i == 0 ) && ( j == 0 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  fork 4,4,4,4 thread4();
  join 1;
  join 2,2;
  join 3,3,3;
  join 4,4,4,4;
  assume !( total == 0 );
  assert false; // should be unreachable
}
