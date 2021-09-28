//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/chromosome-symm.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var o_0 : [int] int;
var isNull_1 : bool;
var o_2 : [int] int;
var isNull_3 : bool;
var break_4 : bool;
var result_5 : int;
var i_6 : int;
var break_7 : bool;
var result_8 : int;
var i_9 : int;


procedure thread1() returns ()
modifies o_0, isNull_1, o_2, isNull_3, break_4, result_5, i_6, break_7, result_8, i_9;
{
  atomic {
    assume !isNull_1;
    break_4 := isNull_3;
    result_5 := 1;
    i_6 := 0;
  }
  while (*) {
    atomic {
      assume !break_4;
      assume ( i_6 < 5 );
      result_5 := ( o_0[i_6] - o_2[i_6] );
      break_4 := ( result_5 != 0 );
      i_6 := ( i_6 + 1 );
    }
  }
  atomic {
    assume ( break_4 || ( i_6 >= 5 ) );
    result_5 := ( if break_4 then result_5 else 0 );
  }
}

procedure thread2() returns ()
modifies o_0, isNull_1, o_2, isNull_3, break_4, result_5, i_6, break_7, result_8, i_9;
{
  atomic {
    assume !isNull_3;
    break_7 := isNull_1;
    result_8 := 1;
    i_9 := 0;
  }
  while (*) {
    atomic {
      assume !break_7;
      assume ( i_9 < 5 );
      result_8 := ( o_2[i_9] - o_0[i_9] );
      break_7 := ( result_8 != 0 );
      i_9 := ( i_9 + 1 );
    }
  }
  atomic {
    assume ( break_7 || ( i_9 >= 5 ) );
    result_8 := ( if break_7 then result_8 else 0 );
  }
}

procedure ULTIMATE.start() returns ()
modifies o_0, isNull_1, o_2, isNull_3, break_4, result_5, i_6, break_7, result_8, i_9;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_5 < 0 ) then ( - 1 ) else ( if ( result_5 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_8 < 0 ) then ( - 1 ) else ( if ( result_8 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
