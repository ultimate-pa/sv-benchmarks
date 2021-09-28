//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/ticket-8.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var m1 : int;
var m2 : int;
var m3 : int;
var m4 : int;
var m5 : int;
var m6 : int;
var m7 : int;
var m8 : int;
var s : int;
var t : int;
var x : int;
var b : bool;


procedure thread1() returns ()
modifies m1, m2, m3, m4, m5, m6, m7, m8, s, t, x, b;
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
modifies m1, m2, m3, m4, m5, m6, m7, m8, s, t, x, b;
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
modifies m1, m2, m3, m4, m5, m6, m7, m8, s, t, x, b;
{
  atomic {
    m3 := t;
    t := ( t + 1 );
  }
  assume ( m3 <= s );
  b := ( b || ( x == 1 ) );
  s := ( s + 1 );
}

procedure thread4() returns ()
modifies m1, m2, m3, m4, m5, m6, m7, m8, s, t, x, b;
{
  atomic {
    m4 := t;
    t := ( t + 1 );
  }
  assume ( m4 <= s );
  b := ( b || ( x == 1 ) );
  s := ( s + 1 );
}

procedure thread5() returns ()
modifies m1, m2, m3, m4, m5, m6, m7, m8, s, t, x, b;
{
  atomic {
    m5 := t;
    t := ( t + 1 );
  }
  assume ( m5 <= s );
  b := ( b || ( x == 1 ) );
  s := ( s + 1 );
}

procedure thread6() returns ()
modifies m1, m2, m3, m4, m5, m6, m7, m8, s, t, x, b;
{
  atomic {
    m6 := t;
    t := ( t + 1 );
  }
  assume ( m6 <= s );
  b := ( b || ( x == 1 ) );
  s := ( s + 1 );
}

procedure thread7() returns ()
modifies m1, m2, m3, m4, m5, m6, m7, m8, s, t, x, b;
{
  atomic {
    m7 := t;
    t := ( t + 1 );
  }
  assume ( m7 <= s );
  b := ( b || ( x == 1 ) );
  s := ( s + 1 );
}

procedure thread8() returns ()
modifies m1, m2, m3, m4, m5, m6, m7, m8, s, t, x, b;
{
  atomic {
    m8 := t;
    t := ( t + 1 );
  }
  assume ( m8 <= s );
  b := ( b || ( x == 1 ) );
  s := ( s + 1 );
}

procedure ULTIMATE.start() returns ()
modifies m1, m2, m3, m4, m5, m6, m7, m8, s, t, x, b;
{
  assume ( ( s == t && s == x && s == 0 ) && ( b == false ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  fork 4,4,4,4 thread4();
  fork 5,5,5,5,5 thread5();
  fork 6,6,6,6,6,6 thread6();
  fork 7,7,7,7,7,7,7 thread7();
  fork 8,8,8,8,8,8,8,8 thread8();
  join 1;
  join 2,2;
  join 3,3,3;
  join 4,4,4,4;
  join 5,5,5,5,5;
  join 6,6,6,6,6,6;
  join 7,7,7,7,7,7,7;
  join 8,8,8,8,8,8,8,8;
  assume b;
  assert false; // should be unreachable
}
