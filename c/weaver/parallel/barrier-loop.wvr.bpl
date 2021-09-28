//#Unsafe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/barrier-loop.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var x_0 : int;
var y_1 : int;
var f1_2 : bool;
var f2_3 : bool;
var temp_4 : int;
var temp_5 : int;
var temp_6 : int;
var temp_7 : int;
var x_8 : int;
var y_9 : int;
var f1_10 : bool;
var f2_11 : bool;
var temp_12 : int;
var temp_13 : int;
var temp_14 : int;
var temp_15 : int;


procedure thread2() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, temp_6, temp_7, x_8, y_9, f1_10, f2_11, temp_12, temp_13, temp_14, temp_15;
{
  while (*) {
    temp_4 := x_0;
    x_0 := ( temp_4 + 1 );
    f1_2 := true;
    assume f2_3;
    temp_5 := y_1;
    y_1 := ( temp_5 + 1 );
    f1_2 := false;
    assume !f2_3;
  }
}

procedure thread3() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, temp_6, temp_7, x_8, y_9, f1_10, f2_11, temp_12, temp_13, temp_14, temp_15;
{
  while (*) {
    temp_6 := y_1;
    y_1 := ( temp_6 + 1 );
    f2_3 := true;
    assume f1_2;
    temp_7 := x_0;
    x_0 := ( temp_7 + 1 );
    f2_3 := false;
    assume !f1_2;
  }
}

procedure thread1() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, temp_6, temp_7, x_8, y_9, f1_10, f2_11, temp_12, temp_13, temp_14, temp_15;
{
  atomic {
    f1_2 := false;
    f2_3 := false;
  }
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 2,2;
  join 3,3,3;
}

procedure thread5() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, temp_6, temp_7, x_8, y_9, f1_10, f2_11, temp_12, temp_13, temp_14, temp_15;
{
  while (*) {
    temp_12 := x_8;
    x_8 := ( temp_12 + 1 );
    f1_10 := true;
    assume f2_11;
    temp_13 := y_9;
    y_9 := ( temp_13 + 1 );
    f1_10 := false;
    assume !f2_11;
  }
}

procedure thread6() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, temp_6, temp_7, x_8, y_9, f1_10, f2_11, temp_12, temp_13, temp_14, temp_15;
{
  while (*) {
    temp_14 := y_9;
    y_9 := ( temp_14 + 1 );
    f2_11 := true;
    assume f1_10;
    temp_15 := x_8;
    x_8 := ( temp_15 + 1 );
    f2_11 := false;
    assume !f1_10;
  }
}

procedure thread4() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, temp_6, temp_7, x_8, y_9, f1_10, f2_11, temp_12, temp_13, temp_14, temp_15;
{
  atomic {
    f1_10 := false;
    f2_11 := false;
  }
  fork 5,5,5,5,5 thread5();
  fork 6,6,6,6,6,6 thread6();
  join 5,5,5,5,5;
  join 6,6,6,6,6,6;
}

procedure ULTIMATE.start() returns ()
modifies x_0, y_1, f1_2, f2_3, temp_4, temp_5, temp_6, temp_7, x_8, y_9, f1_10, f2_11, temp_12, temp_13, temp_14, temp_15;
{
  assume ( ( x_0 == x_8 ) && ( y_1 == y_9 ) );
  fork 1 thread1();
  fork 4,4,4,4 thread4();
  join 1;
  join 4,4,4,4;
  assume !( ( x_0 == x_8 ) && ( y_1 == y_9 ) );
  assert false; // should be unreachable
}
