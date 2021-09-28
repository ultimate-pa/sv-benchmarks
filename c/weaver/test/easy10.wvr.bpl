//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/test/easy10.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var x1 : int;
var x2 : int;
var y1 : int;
var y2 : int;
var t11 : int;
var t12 : int;
var t21 : int;
var t22 : int;
var f11 : bool;
var f12 : bool;
var f21 : bool;
var f22 : bool;


procedure thread1() returns ()
modifies x1, x2, y1, y2, t11, t12, t21, t22, f11, f12, f21, f22;
{
  t11 := ( x1 + 1 );
  x1 := t11;
  f11 := true;
  assume ( f11 && f21 );
  t11 := ( y1 + 1 );
  y1 := t11;
}

procedure thread2() returns ()
modifies x1, x2, y1, y2, t11, t12, t21, t22, f11, f12, f21, f22;
{
  t21 := ( y1 + 1 );
  y1 := t21;
  f21 := true;
  assume ( f11 && f21 );
  t21 := ( x1 + 1 );
  x1 := t21;
}

procedure thread3() returns ()
modifies x1, x2, y1, y2, t11, t12, t21, t22, f11, f12, f21, f22;
{
  t12 := ( x2 + 1 );
  x2 := t12;
  f12 := true;
  assume ( f12 && f22 );
  t12 := ( y2 + 1 );
  y2 := t12;
}

procedure thread4() returns ()
modifies x1, x2, y1, y2, t11, t12, t21, t22, f11, f12, f21, f22;
{
  t22 := ( y2 + 1 );
  y2 := t22;
  f22 := true;
  assume ( f12 && f22 );
  t22 := ( x2 + 1 );
  x2 := t22;
}

procedure ULTIMATE.start() returns ()
modifies x1, x2, y1, y2, t11, t12, t21, t22, f11, f12, f21, f22;
{
  assume ( ( x1 == x2 ) && ( y1 == y2 ) && ( f11 == f12 && f11 == f21 && f11 == f22 && f11 == false ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  fork 4,4,4,4 thread4();
  join 1;
  join 2,2;
  join 3,3,3;
  join 4,4,4,4;
  assume !( ( x1 == x2 ) && ( y1 == y2 ) );
  assert false; // should be unreachable
}
