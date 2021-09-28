//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/word-symm.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var array_0 : [int] int;
var count_1 : int;
var len_2 : int;
var array_3 : [int] int;
var count_4 : int;
var len_5 : int;
var i_6 : int;
var break_7 : bool;
var result_8 : int;
var i_9 : int;
var break_10 : bool;
var result_11 : int;


procedure thread1() returns ()
modifies array_0, count_1, len_2, array_3, count_4, len_5, i_6, break_7, result_8, i_9, break_10, result_11;
{
  if (*) {
    atomic {
      assume ( count_1 == count_4 );
      i_6 := 0;
      break_7 := false;
    }
    while (*) {
      atomic {
        assume ( !break_7 && ( ( i_6 < len_2 ) && ( i_6 < len_5 ) ) );
        result_8 := ( if ( ( array_0[i_6] - array_3[i_6] ) < 0 ) then ( 0 - 1 ) else ( if ( ( array_0[i_6] - array_3[i_6] ) > 0 ) then 1 else result_8 ) );
        break_7 := ( if ( ( array_0[i_6] - array_3[i_6] ) != 0 ) then true else break_7 );
        i_6 := ( i_6 + 1 );
      }
    }
    atomic {
      assume !( !break_7 && ( ( i_6 < len_2 ) && ( i_6 < len_5 ) ) );
      result_8 := ( if !break_7 then ( len_2 - len_5 ) else result_8 );
    }
  }
  else {
    atomic {
      assume !( count_1 == count_4 );
      result_8 := ( if ( count_1 > count_4 ) then 1 else ( 0 - 1 ) );
    }
  }
}

procedure thread2() returns ()
modifies array_0, count_1, len_2, array_3, count_4, len_5, i_6, break_7, result_8, i_9, break_10, result_11;
{
  if (*) {
    atomic {
      assume ( count_4 == count_1 );
      i_9 := 0;
      break_10 := false;
    }
    while (*) {
      atomic {
        assume ( !break_10 && ( ( i_9 < len_5 ) && ( i_9 < len_2 ) ) );
        result_11 := ( if ( ( array_3[i_9] - array_0[i_9] ) < 0 ) then ( 0 - 1 ) else ( if ( ( array_3[i_9] - array_0[i_9] ) > 0 ) then 1 else result_11 ) );
        break_10 := ( if ( ( array_3[i_9] - array_0[i_9] ) != 0 ) then true else break_10 );
        i_9 := ( i_9 + 1 );
      }
    }
    atomic {
      assume !( !break_10 && ( ( i_9 < len_5 ) && ( i_9 < len_2 ) ) );
      result_11 := ( if !break_10 then ( len_5 - len_2 ) else result_11 );
    }
  }
  else {
    atomic {
      assume !( count_4 == count_1 );
      result_11 := ( if ( count_4 > count_1 ) then 1 else ( 0 - 1 ) );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies array_0, count_1, len_2, array_3, count_4, len_5, i_6, break_7, result_8, i_9, break_10, result_11;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_8 < 0 ) then ( - 1 ) else ( if ( result_8 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_11 < 0 ) then ( - 1 ) else ( if ( result_11 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
