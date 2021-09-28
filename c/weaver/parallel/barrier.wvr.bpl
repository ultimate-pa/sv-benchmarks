//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/barrier.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var x_0 : int;
var y_1 : int;
var f1_2 : bool;
var f2_3 : bool;
var temp_4 : int;
var temp_5 : int;
var x_6 : int;
var y_7 : int;
var f1_8 : bool;
var f2_9 : bool;
var temp_10 : int;
var temp_11 : int;


procedure thread2() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, x_6, y_7, f1_8, f2_9, temp_10, temp_11;
{
  temp_4 := x_0;
  x_0 := ( temp_4 + 1 );
  f1_2 := true;
  assume ( f1_2 && f2_3 );
  temp_4 := y_1;
  y_1 := ( temp_4 + 1 );
}

procedure thread3() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, x_6, y_7, f1_8, f2_9, temp_10, temp_11;
{
  temp_5 := y_1;
  y_1 := ( temp_5 + 1 );
  f2_3 := true;
  assume ( f1_2 && f2_3 );
  temp_5 := x_0;
  x_0 := ( temp_5 + 1 );
}

procedure thread1() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, x_6, y_7, f1_8, f2_9, temp_10, temp_11;
{
  assume ( ( x_0 == y_1 ) && ( !f1_2 && !f2_3 ) );
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 2,2;
  join 3,3,3;
}

procedure thread5() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, x_6, y_7, f1_8, f2_9, temp_10, temp_11;
{
  temp_10 := x_6;
  x_6 := ( temp_10 + 1 );
  f1_8 := true;
  assume ( f1_8 && f2_9 );
  temp_10 := y_7;
  y_7 := ( temp_10 + 1 );
}

procedure thread6() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, x_6, y_7, f1_8, f2_9, temp_10, temp_11;
{
  temp_11 := y_7;
  y_7 := ( temp_11 + 1 );
  f2_9 := true;
  assume ( f1_8 && f2_9 );
  temp_11 := x_6;
  x_6 := ( temp_11 + 1 );
}

procedure thread4() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, x_6, y_7, f1_8, f2_9, temp_10, temp_11;
{
  assume ( ( x_6 == y_7 ) && ( !f1_8 && !f2_9 ) );
  fork 5,5,5,5,5 thread5();
  fork 6,6,6,6,6,6 thread6();
  join 5,5,5,5,5;
  join 6,6,6,6,6,6;
}

procedure ULTIMATE.start() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, x_6, y_7, f1_8, f2_9, temp_10, temp_11;
{
  assume ( ( x_0 == x_6 ) && ( y_1 == y_7 ) );
  fork 1 thread1();
  fork 4,4,4,4 thread4();
  join 1;
  join 4,4,4,4;
  assume !( ( x_0 == x_6 ) && ( y_1 == y_7 ) );
  assert false; // should be unreachable
}
