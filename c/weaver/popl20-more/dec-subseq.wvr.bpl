//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-more/dec-subseq.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var A : [int] int;
var queue : [int] int;
var i : int;
var N : int;
var last : int;
var start : int;
var end : int;
var new : int;
var v_old : int;
var ok : bool;


procedure thread1() returns ()
modifies A, queue, i, N, last, start, end, new, v_old, ok;
{
  while (( i < N )) {
    if (( A[i] <= last )) {
      atomic {
        assume ( queue[end] == A[i] );
        end := ( end + 1 );
      }
      last := A[i];

    }
    i := ( i + 1 );
  }
}

procedure thread2() returns ()
modifies A, queue, i, N, last, start, end, new, v_old, ok;
{
  while (( ( i < N ) || ( start < end ) )) {
    atomic {
      assume ( start < end );
      new := queue[start];
      start := ( start + 1 );
    }
    ok := ( ok && ( v_old >= new ) );
    v_old := new;
  }
}

procedure ULTIMATE.start() returns ()
modifies A, queue, i, N, last, start, end, new, v_old, ok;
{
  assume ( start == end );
  assume ( v_old == last && v_old == A[0] );
  assume ( i == 0 );
  assume ok;
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !ok;
  assert false; // should be unreachable
}
