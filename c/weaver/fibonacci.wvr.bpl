//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/fibonacci.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var n_0 : int;
var i_1 : int;
var f1_2 : int;
var f2_3 : int;
var l_4 : int;
var i_5 : int;
var f1_6 : int;
var f2_7 : int;
var l_8 : int;


procedure thread1() returns ()
modifies n_0, i_1, f1_2, f2_3, l_4, i_5, f1_6, f2_7, l_8;
{
  i_1 := 0;
  while (*) {
    atomic {
      assume ( i_1 < n_0 );
      f1_2 := ( f1_2 + f2_3 );
      f2_3 := ( f1_2 - f2_3 );
      i_1 := ( i_1 + 1 );
    }
  }
  atomic {
    assume ( i_1 >= n_0 );
    l_4 := ( if ( f1_2 > 0 ) then 1 else 0 );
  }
}

procedure thread2() returns ()
modifies n_0, i_1, f1_2, f2_3, l_4, i_5, f1_6, f2_7, l_8;
{
  i_5 := 0;
  while (*) {
    atomic {
      assume ( i_5 < n_0 );
      f1_6 := ( f1_6 + f2_7 );
      f2_7 := ( f1_6 - f2_7 );
      i_5 := ( i_5 + 1 );
    }
  }
  atomic {
    assume ( i_5 >= n_0 );
    l_8 := ( if ( f1_6 > 0 ) then 1 else 0 );
  }
}

procedure ULTIMATE.start() returns ()
modifies n_0, i_1, f1_2, f2_3, l_4, i_5, f1_6, f2_7, l_8;
{
  assume ( ( f1_2 == f1_6 ) && ( f2_3 == f2_7 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( l_4 == l_8 );
  assert false; // should be unreachable
}
