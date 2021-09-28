//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/threaded-sum-3.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var s : int;
var t : int;
var m : int;
var c : int;
var T : int;
var S : int;
var u : int;
var U : int;


procedure thread1() returns ()
modifies s, t, m, c, T, S, u, U;
{
  while (( ( 0 < s ) || ( 0 < t ) || ( 0 < u ) )) {
    if (*) {
      atomic {
        assume ( 0 < s );
        s := ( s - 1 );
        m := ( m + 1 );
      }
    }
    else {
      assume !( 0 < s );
    }
  }
}

procedure thread2() returns ()
modifies s, t, m, c, T, S, u, U;
{
  while (( ( 0 < t ) || ( 0 < u ) )) {
    if (*) {
      atomic {
        assume ( 0 < t );
        t := ( t - 1 );
        s := ( s + 1 );
      }
    }
    else {
      assume !( 0 < t );
    }
  }
}

procedure thread3() returns ()
modifies s, t, m, c, T, S, u, U;
{
  while (( 0 < u )) {
    t := ( t + 1 );
    u := ( u - 1 );
  }
}

procedure ULTIMATE.start() returns ()
modifies s, t, m, c, T, S, u, U;
{
  assume ( m == 0 );
  assume ( 0 < T );
  assume ( 0 < S );
  assume ( 0 < U );
  assume ( t == T );
  assume ( s == S );
  assume ( u == U );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( m == ( S + T + U ) );
  assert false; // should be unreachable
}
