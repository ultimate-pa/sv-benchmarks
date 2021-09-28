//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-bad/threaded-sum-2.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var s : int;
var t : int;
var m : int;
var c : int;
var T : int;
var S : int;


procedure thread1() returns ()
modifies s, t, m, c, T, S;
{
  while (( ( 0 < s ) || ( 0 < t ) )) {
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
modifies s, t, m, c, T, S;
{
  while (( 0 < t )) {
    s := ( s + 1 );
    t := ( t - 1 );
  }
}

procedure ULTIMATE.start() returns ()
modifies s, t, m, c, T, S;
{
  assume ( m == 0 );
  assume ( 0 < t );
  assume ( 0 < s );
  assume ( t == T );
  assume ( s == S );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( m == ( S + T ) );
  assert false; // should be unreachable
}
