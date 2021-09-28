//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/ticket-3.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var m1 : int;
var m2 : int;
var m3 : int;
var s : int;
var t : int;
var x : int;
var b : bool;


procedure thread1() returns ()
modifies m1, m2, m3, s, t, x, b;
{
  atomic {
    m1 := t;
    t := ( t + 1 );
  }
  assume ( m1 <= s );
  x := 1;
  x := 0;
  s := ( s + 1 );
}

procedure thread2() returns ()
modifies m1, m2, m3, s, t, x, b;
{
  atomic {
    m2 := t;
    t := ( t + 1 );
  }
  assume ( m2 <= s );
  b := ( b || ( x == 1 ) );
  s := ( s + 1 );
}

procedure thread3() returns ()
modifies m1, m2, m3, s, t, x, b;
{
  atomic {
    m3 := t;
    t := ( t + 1 );
  }
  assume ( m3 <= s );
  b := ( b || ( x == 1 ) );
  s := ( s + 1 );
}

procedure ULTIMATE.start() returns ()
modifies m1, m2, m3, s, t, x, b;
{
  assume ( ( s == t && s == x && s == 0 ) && ( b == false ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume b;
  assert false; // should be unreachable
}
