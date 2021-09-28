//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/queue-add-3.wvr'.
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
var k : int;
var s : int;
var t : int;
var N : int;
var f : bool;
var g : bool;


procedure thread1() returns ()
modifies q1, q1_front, q1_back, q2, q2_front, q2_back, i, j, k, s, t, N, f, g;
{
  i := 0;
  while (( i < N )) {
    atomic {
      assume ( q1[q1_back] == 1 );
      q1_back := ( q1_back + 1 );
    }
    i := ( i + 1 );
  }
  atomic {
    assume ( q1[q1_back] == 0 );
    q1_back := ( q1_back + 1 );
  }
}

procedure thread2() returns ()
modifies q1, q1_front, q1_back, q2, q2_front, q2_back, i, j, k, s, t, N, f, g;
{
  s := 0;
  f := true;
  while (f) {
    atomic {
      assume ( q1_back > q1_front );
      j := q1[q1_front];
      q1_front := ( q1_front + 1 );
    }
    atomic {
      assume ( q2[q2_back] == j );
      q2_back := ( q2_back + 1 );
    }
    s := ( s + j );
    f := ( j != 0 );
  }
}

procedure thread3() returns ()
modifies q1, q1_front, q1_back, q2, q2_front, q2_back, i, j, k, s, t, N, f, g;
{
  t := 0;
  g := true;
  while (g) {
    atomic {
      assume ( q2_back > q2_front );
      k := q2[q2_front];
      q2_front := ( q2_front + 1 );
    }
    t := ( t + k );
    g := ( k != 0 );
  }
}

procedure ULTIMATE.start() returns ()
modifies q1, q1_front, q1_back, q2, q2_front, q2_back, i, j, k, s, t, N, f, g;
{
  assume ( ( q1_front == q1_back ) && ( q2_front == q2_back ) && ( N >= 0 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( t == N );
  assert false; // should be unreachable
}
