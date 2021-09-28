//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/name-comparator-symm.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var nondet_0 : [int] int;
var name_1 : int;
var name_2 : int;
var result_3 : int;
var i_4 : int;
var current_5 : int;
var break_6 : bool;
var result_7 : int;
var i_8 : int;
var current_9 : int;
var break_10 : bool;


procedure thread1() returns ()
modifies nondet_0, name_1, name_2, result_3, i_4, current_5, break_6, result_7, i_8, current_9, break_10;
{
  atomic {
    i_4 := 0;
    break_6 := false;
    result_3 := ( if ( name_1 == name_2 ) then 0 else result_3 );
    break_6 := ( if ( name_1 == name_2 ) then true else break_6 );
  }
  while (*) {
    atomic {
      assume ( ( i_4 < 3 ) && !break_6 );
      current_5 := nondet_0[i_4];
      result_3 := ( if ( current_5 == name_1 ) then 1 else result_3 );
      break_6 := ( if ( current_5 == name_1 ) then true else break_6 );
      result_3 := ( if ( !break_6 && ( current_5 == name_2 ) ) then ( 0 - 1 ) else result_3 );
      break_6 := ( if ( !break_6 && ( current_5 == name_2 ) ) then true else break_6 );
      i_4 := ( i_4 + 1 );
    }
  }
  atomic {
    assume !( ( i_4 < 3 ) && !break_6 );
    result_3 := ( if !break_6 then ( name_1 - name_2 ) else result_3 );
  }
}

procedure thread2() returns ()
modifies nondet_0, name_1, name_2, result_3, i_4, current_5, break_6, result_7, i_8, current_9, break_10;
{
  atomic {
    i_8 := 0;
    break_10 := false;
    result_7 := ( if ( name_2 == name_1 ) then 0 else result_7 );
    break_10 := ( if ( name_2 == name_1 ) then true else break_10 );
  }
  while (*) {
    atomic {
      assume ( ( i_8 < 3 ) && !break_10 );
      current_9 := nondet_0[i_8];
      result_7 := ( if ( current_9 == name_2 ) then 1 else result_7 );
      break_10 := ( if ( current_9 == name_2 ) then true else break_10 );
      result_7 := ( if ( !break_10 && ( current_9 == name_1 ) ) then ( 0 - 1 ) else result_7 );
      break_10 := ( if ( !break_10 && ( current_9 == name_1 ) ) then true else break_10 );
      i_8 := ( i_8 + 1 );
    }
  }
  atomic {
    assume !( ( i_8 < 3 ) && !break_10 );
    result_7 := ( if !break_10 then ( name_2 - name_1 ) else result_7 );
  }
}

procedure ULTIMATE.start() returns ()
modifies nondet_0, name_1, name_2, result_3, i_4, current_5, break_6, result_7, i_8, current_9, break_10;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_3 < 0 ) then ( - 1 ) else ( if ( result_3 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_7 < 0 ) then ( - 1 ) else ( if ( result_7 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
