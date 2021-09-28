//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/array-int-symm.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var array_0 : [int] int;
var len_1 : int;
var array_2 : [int] int;
var len_3 : int;
var i_4 : int;
var break_5 : bool;
var result_6 : int;
var i_7 : int;
var break_8 : bool;
var result_9 : int;


procedure thread1() returns ()
modifies array_0, len_1, array_2, len_3, i_4, break_5, result_6, i_7, break_8, result_9;
{
  atomic {
    i_4 := 0;
    break_5 := false;
    result_6 := ( len_1 - len_3 );
  }
  while (*) {
    atomic {
      assume ( ( i_4 < len_1 ) && ( ( i_4 < len_3 ) && !break_5 ) );
      i_4 := ( i_4 + 1 );
      break_5 := ( array_0[i_4] != array_2[i_4] );
      result_6 := ( if ( array_0[i_4] == array_2[i_4] ) then result_6 else ( array_0[i_4] - array_2[i_4] ) );
    }
  }
  assume !( ( i_4 < len_1 ) && ( ( i_4 < len_3 ) && !break_5 ) );
}

procedure thread2() returns ()
modifies array_0, len_1, array_2, len_3, i_4, break_5, result_6, i_7, break_8, result_9;
{
  atomic {
    i_7 := 0;
    break_8 := false;
    result_9 := ( len_3 - len_1 );
  }
  while (*) {
    atomic {
      assume ( ( i_7 < len_3 ) && ( ( i_7 < len_1 ) && !break_8 ) );
      i_7 := ( i_7 + 1 );
      break_8 := ( array_2[i_7] != array_0[i_7] );
      result_9 := ( if ( array_2[i_7] == array_0[i_7] ) then result_9 else ( array_2[i_7] - array_0[i_7] ) );
    }
  }
  assume !( ( i_7 < len_3 ) && ( ( i_7 < len_1 ) && !break_8 ) );
}

procedure ULTIMATE.start() returns ()
modifies array_0, len_1, array_2, len_3, i_4, break_5, result_6, i_7, break_8, result_9;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_6 < 0 ) then ( - 1 ) else ( if ( result_6 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_9 < 0 ) then ( - 1 ) else ( if ( result_9 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
