//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/word-subst.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var get_0 : [int] int;
var count_1 : int;
var len_2 : int;
var get_3 : [int] int;
var count_4 : int;
var len_5 : int;
var get_6 : [int] int;
var count_7 : int;
var len_8 : int;
var i_9 : int;
var break_10 : bool;
var result_11 : int;
var i_12 : int;
var break_13 : bool;
var result_14 : int;
var i_15 : int;
var break_16 : bool;
var result_17 : int;


procedure thread1() returns ()
modifies get_0, count_1, len_2, get_3, count_4, len_5, get_6, count_7, len_8, i_9, break_10, result_11, i_12, break_13, result_14, i_15, break_16, result_17;
{
  if (*) {
    atomic {
      assume ( count_1 == count_4 );
      i_9 := 0;
      break_10 := false;
    }
    while (*) {
      atomic {
        assume ( !break_10 && ( ( i_9 < len_2 ) && ( i_9 < len_5 ) ) );
        result_11 := ( if ( ( get_0[i_9] - get_3[i_9] ) < 0 ) then ( 0 - 1 ) else ( if ( ( get_0[i_9] - get_3[i_9] ) > 0 ) then 1 else result_11 ) );
        break_10 := ( if ( ( get_0[i_9] - get_3[i_9] ) != 0 ) then true else break_10 );
        i_9 := ( i_9 + 1 );
      }
    }
    atomic {
      assume !( !break_10 && ( ( i_9 < len_2 ) && ( i_9 < len_5 ) ) );
      result_11 := ( if !break_10 then ( len_2 - len_5 ) else result_11 );
    }
  }
  else {
    atomic {
      assume !( count_1 == count_4 );
      result_11 := ( if ( count_1 > count_4 ) then 1 else ( 0 - 1 ) );
    }
  }
}

procedure thread2() returns ()
modifies get_0, count_1, len_2, get_3, count_4, len_5, get_6, count_7, len_8, i_9, break_10, result_11, i_12, break_13, result_14, i_15, break_16, result_17;
{
  if (*) {
    atomic {
      assume ( count_1 == count_7 );
      i_12 := 0;
      break_13 := false;
    }
    while (*) {
      atomic {
        assume ( !break_13 && ( ( i_12 < len_2 ) && ( i_12 < len_8 ) ) );
        result_14 := ( if ( ( get_0[i_12] - get_6[i_12] ) < 0 ) then ( 0 - 1 ) else ( if ( ( get_0[i_12] - get_6[i_12] ) > 0 ) then 1 else result_14 ) );
        break_13 := ( if ( ( get_0[i_12] - get_6[i_12] ) != 0 ) then true else break_13 );
        i_12 := ( i_12 + 1 );
      }
    }
    atomic {
      assume !( !break_13 && ( ( i_12 < len_2 ) && ( i_12 < len_8 ) ) );
      result_14 := ( if !break_13 then ( len_2 - len_8 ) else result_14 );
    }
  }
  else {
    atomic {
      assume !( count_1 == count_7 );
      result_14 := ( if ( count_1 > count_7 ) then 1 else ( 0 - 1 ) );
    }
  }
}

procedure thread3() returns ()
modifies get_0, count_1, len_2, get_3, count_4, len_5, get_6, count_7, len_8, i_9, break_10, result_11, i_12, break_13, result_14, i_15, break_16, result_17;
{
  if (*) {
    atomic {
      assume ( count_4 == count_7 );
      i_15 := 0;
      break_16 := false;
    }
    while (*) {
      atomic {
        assume ( !break_16 && ( ( i_15 < len_5 ) && ( i_15 < len_8 ) ) );
        result_17 := ( if ( ( get_3[i_15] - get_6[i_15] ) < 0 ) then ( 0 - 1 ) else ( if ( ( get_3[i_15] - get_6[i_15] ) > 0 ) then 1 else result_17 ) );
        break_16 := ( if ( ( get_3[i_15] - get_6[i_15] ) != 0 ) then true else break_16 );
        i_15 := ( i_15 + 1 );
      }
    }
    atomic {
      assume !( !break_16 && ( ( i_15 < len_5 ) && ( i_15 < len_8 ) ) );
      result_17 := ( if !break_16 then ( len_5 - len_8 ) else result_17 );
    }
  }
  else {
    atomic {
      assume !( count_4 == count_7 );
      result_17 := ( if ( count_4 > count_7 ) then 1 else ( 0 - 1 ) );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies get_0, count_1, len_2, get_3, count_4, len_5, get_6, count_7, len_8, i_9, break_10, result_11, i_12, break_13, result_14, i_15, break_16, result_17;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( result_11 == 0 ) ==> ( ( ( result_14 > 0 ) == ( result_17 > 0 ) ) && ( ( result_14 < 0 ) == ( result_17 < 0 ) ) ) );
  assert false; // should be unreachable
}
