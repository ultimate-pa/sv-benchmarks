//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/array-int-trans.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var array_0 : [int] int;
var len_1 : int;
var array_2 : [int] int;
var len_3 : int;
var array_4 : [int] int;
var len_5 : int;
var i_6 : int;
var break_7 : bool;
var result_8 : int;
var i_9 : int;
var break_10 : bool;
var result_11 : int;
var i_12 : int;
var break_13 : bool;
var result_14 : int;


procedure thread1() returns ()
modifies array_0, len_1, array_2, len_3, array_4, len_5, i_6, break_7, result_8, i_9, break_10, result_11, i_12, break_13, result_14;
{
  atomic {
    i_6 := 0;
    break_7 := false;
    result_8 := ( len_1 - len_3 );
  }
  while (*) {
    atomic {
      assume ( ( i_6 < len_1 ) && ( ( i_6 < len_3 ) && !break_7 ) );
      i_6 := ( i_6 + 1 );
      break_7 := ( array_0[i_6] != array_2[i_6] );
      result_8 := ( if ( array_0[i_6] == array_2[i_6] ) then result_8 else ( array_0[i_6] - array_2[i_6] ) );
    }
  }
  assume !( ( i_6 < len_1 ) && ( ( i_6 < len_3 ) && !break_7 ) );
}

procedure thread2() returns ()
modifies array_0, len_1, array_2, len_3, array_4, len_5, i_6, break_7, result_8, i_9, break_10, result_11, i_12, break_13, result_14;
{
  atomic {
    i_9 := 0;
    break_10 := false;
    result_11 := ( len_3 - len_5 );
  }
  while (*) {
    atomic {
      assume ( ( i_9 < len_3 ) && ( ( i_9 < len_5 ) && !break_10 ) );
      i_9 := ( i_9 + 1 );
      break_10 := ( array_2[i_9] != array_4[i_9] );
      result_11 := ( if ( array_2[i_9] == array_4[i_9] ) then result_11 else ( array_2[i_9] - array_4[i_9] ) );
    }
  }
  assume !( ( i_9 < len_3 ) && ( ( i_9 < len_5 ) && !break_10 ) );
}

procedure thread3() returns ()
modifies array_0, len_1, array_2, len_3, array_4, len_5, i_6, break_7, result_8, i_9, break_10, result_11, i_12, break_13, result_14;
{
  atomic {
    i_12 := 0;
    break_13 := false;
    result_14 := ( len_1 - len_5 );
  }
  while (*) {
    atomic {
      assume ( ( i_12 < len_1 ) && ( ( i_12 < len_5 ) && !break_13 ) );
      i_12 := ( i_12 + 1 );
      break_13 := ( array_0[i_12] != array_4[i_12] );
      result_14 := ( if ( array_0[i_12] == array_4[i_12] ) then result_14 else ( array_0[i_12] - array_4[i_12] ) );
    }
  }
  assume !( ( i_12 < len_1 ) && ( ( i_12 < len_5 ) && !break_13 ) );
}

procedure ULTIMATE.start() returns ()
modifies array_0, len_1, array_2, len_3, array_4, len_5, i_6, break_7, result_8, i_9, break_10, result_11, i_12, break_13, result_14;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( ( result_8 > 0 ) && ( result_11 > 0 ) ) ==> ( result_14 > 0 ) );
  assert false; // should be unreachable
}
