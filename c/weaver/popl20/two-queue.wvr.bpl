//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/two-queue.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var q1 : [int] int;
var q1_front : int;
var q1_back : int;
var q2 : [int] int;
var q2_front : int;
var q2_back : int;
var i : int;
var j : int;
var N : int;


procedure thread1() returns ()
modifies q1, q1_front, q1_back, q2, q2_front, q2_back, i, j, N;
{
  while (( i < N )) {
    atomic {
      assume ( q2[q2_back] == i );
      q2_back := ( q2_back + 1 );
    }
    atomic {
      assume ( q1_back > q1_front );
      i := q1[q1_front];
      q1_front := ( q1_front + 1 );
    }
    i := ( i + 1 );
  }
}

procedure thread2() returns ()
modifies q1, q1_front, q1_back, q2, q2_front, q2_back, i, j, N;
{
  while (( j < N )) {
    atomic {
      assume ( q1[q1_back] == j );
      q1_back := ( q1_back + 1 );
    }
    atomic {
      assume ( q2_back > q2_front );
      j := q2[q2_front];
      q2_front := ( q2_front + 1 );
    }
    j := ( j + 1 );
  }
}

procedure ULTIMATE.start() returns ()
modifies q1, q1_front, q1_back, q2, q2_front, q2_back, i, j, N;
{
  assume ( ( i == j && i == 0 ) && ( q1_front == q1_back ) && ( q2_front == q2_back ) );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( i == j );
  assert false; // should be unreachable
}
