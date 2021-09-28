//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/parallel-sum-1-dsl.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var X_0 : [int] int;
var n_1 : int;
var s_2 : int;
var i_3 : int;
var t_4 : int;
var t_5 : int;
var s_6 : int;
var i_7 : int;
var t_8 : int;
var t_9 : int;


procedure thread2() returns ()
modifies X_0, n_1, s_2, i_3, t_4, t_5, s_6, i_7, t_8, t_9;
{
  while (*) {
    atomic {
      assume ( i_3 < n_1 );
      i_3 := ( i_3 + 1 );
      t_4 := X_0[i_3];
    }
    s_2 := ( s_2 + t_4 );
  }
  assume !( i_3 < n_1 );
}

procedure thread3() returns ()
modifies X_0, n_1, s_2, i_3, t_4, t_5, s_6, i_7, t_8, t_9;
{
  while (*) {
    atomic {
      assume ( i_3 < n_1 );
      i_3 := ( i_3 + 1 );
      t_5 := X_0[i_3];
    }
    s_2 := ( s_2 + t_5 );
  }
  assume !( i_3 < n_1 );
}

procedure thread1() returns ()
modifies X_0, n_1, s_2, i_3, t_4, t_5, s_6, i_7, t_8, t_9;
{
  atomic {
    i_3 := 0;
    s_2 := 0;
  }
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 2,2;
  join 3,3,3;
}

procedure thread5() returns ()
modifies X_0, n_1, s_2, i_3, t_4, t_5, s_6, i_7, t_8, t_9;
{
  while (*) {
    atomic {
      assume ( i_7 < n_1 );
      i_7 := ( i_7 + 1 );
      t_8 := X_0[i_7];
    }
    s_6 := ( s_6 + t_8 );
  }
  assume !( i_7 < n_1 );
}

procedure thread6() returns ()
modifies X_0, n_1, s_2, i_3, t_4, t_5, s_6, i_7, t_8, t_9;
{
  while (*) {
    atomic {
      assume ( i_7 < n_1 );
      i_7 := ( i_7 + 1 );
      t_9 := X_0[i_7];
    }
    s_6 := ( s_6 + t_9 );
  }
  assume !( i_7 < n_1 );
}

procedure thread4() returns ()
modifies X_0, n_1, s_2, i_3, t_4, t_5, s_6, i_7, t_8, t_9;
{
  atomic {
    i_7 := 0;
    s_6 := 0;
  }
  fork 5,5,5,5,5 thread5();
  fork 6,6,6,6,6,6 thread6();
  join 5,5,5,5,5;
  join 6,6,6,6,6,6;
}

procedure ULTIMATE.start() returns ()
modifies X_0, n_1, s_2, i_3, t_4, t_5, s_6, i_7, t_8, t_9;
{
  fork 1 thread1();
  fork 4,4,4,4 thread4();
  join 1;
  join 4,4,4,4;
  assume !( s_2 == s_6 );
  assert false; // should be unreachable
}
