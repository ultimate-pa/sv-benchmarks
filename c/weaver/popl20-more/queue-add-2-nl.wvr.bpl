//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-more/queue-add-2-nl.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var q : [int] int;
var q_front : int;
var q_back : int;
var i : int;
var j : int;
var s : int;
var x : int;
var y : int;
var N : int;
var C : int;
var f : bool;


procedure thread1() returns ()
modifies q, q_front, q_back, i, j, s, x, y, N, C, f;
{
  i := 0;
  while (( i < N )) {
    atomic {
      assume ( q[q_back] == 1 );
      q_back := ( q_back + 1 );
    }
    x := ( x + C );
    i := ( i + 1 );
  }
  atomic {
    assume ( q[q_back] == 0 );
    q_back := ( q_back + 1 );
  }
  x := ( x + C );
}

procedure thread2() returns ()
modifies q, q_front, q_back, i, j, s, x, y, N, C, f;
{
  s := 0;
  f := true;
  while (f) {
    atomic {
      assume ( q_back > q_front );
      j := q[q_front];
      q_front := ( q_front + 1 );
    }
    s := ( s + j );
    y := ( y + C );
    f := ( j != 0 );
  }
}

procedure ULTIMATE.start() returns ()
modifies q, q_front, q_back, i, j, s, x, y, N, C, f;
{
  assume ( ( q_front == q_back ) && ( x == y && x == 0 ) && ( N >= 0 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( x == y ) && ( s == N ) );
  assert false; // should be unreachable
}
