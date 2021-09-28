//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/chromosome-trans.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var o_0 : [int] int;
var isNull_1 : bool;
var o_2 : [int] int;
var isNull_3 : bool;
var o_4 : [int] int;
var isNull_5 : bool;
var break_6 : bool;
var result_7 : int;
var i_8 : int;
var break_9 : bool;
var result_10 : int;
var i_11 : int;
var break_12 : bool;
var result_13 : int;
var i_14 : int;


procedure thread1() returns ()
modifies o_0, isNull_1, o_2, isNull_3, o_4, isNull_5, break_6, result_7, i_8, break_9, result_10, i_11, break_12, result_13, i_14;
{
  atomic {
    assume !isNull_1;
    break_6 := isNull_3;
    result_7 := 1;
    i_8 := 0;
  }
  while (*) {
    atomic {
      assume !break_6;
      assume ( i_8 < 5 );
      result_7 := ( o_0[i_8] - o_2[i_8] );
      break_6 := ( result_7 != 0 );
      i_8 := ( i_8 + 1 );
    }
  }
  atomic {
    assume ( break_6 || ( i_8 >= 5 ) );
    result_7 := ( if break_6 then result_7 else 0 );
  }
}

procedure thread2() returns ()
modifies o_0, isNull_1, o_2, isNull_3, o_4, isNull_5, break_6, result_7, i_8, break_9, result_10, i_11, break_12, result_13, i_14;
{
  atomic {
    assume !isNull_3;
    break_9 := isNull_5;
    result_10 := 1;
    i_11 := 0;
  }
  while (*) {
    atomic {
      assume !break_9;
      assume ( i_11 < 5 );
      result_10 := ( o_2[i_11] - o_4[i_11] );
      break_9 := ( result_10 != 0 );
      i_11 := ( i_11 + 1 );
    }
  }
  atomic {
    assume ( break_9 || ( i_11 >= 5 ) );
    result_10 := ( if break_9 then result_10 else 0 );
  }
}

procedure thread3() returns ()
modifies o_0, isNull_1, o_2, isNull_3, o_4, isNull_5, break_6, result_7, i_8, break_9, result_10, i_11, break_12, result_13, i_14;
{
  atomic {
    assume !isNull_1;
    break_12 := isNull_5;
    result_13 := 1;
    i_14 := 0;
  }
  while (*) {
    atomic {
      assume !break_12;
      assume ( i_14 < 5 );
      result_13 := ( o_0[i_14] - o_4[i_14] );
      break_12 := ( result_13 != 0 );
      i_14 := ( i_14 + 1 );
    }
  }
  atomic {
    assume ( break_12 || ( i_14 >= 5 ) );
    result_13 := ( if break_12 then result_13 else 0 );
  }
}

procedure ULTIMATE.start() returns ()
modifies o_0, isNull_1, o_2, isNull_3, o_4, isNull_5, break_6, result_7, i_8, break_9, result_10, i_11, break_12, result_13, i_14;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( ( result_7 > 0 ) && ( result_10 > 0 ) ) ==> ( result_13 > 0 ) );
  assert false; // should be unreachable
}
