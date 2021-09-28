//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/name-comparator-trans.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var nondet_0 : [int] int;
var name_1 : int;
var name_2 : int;
var name_3 : int;
var result_4 : int;
var i_5 : int;
var current_6 : int;
var break_7 : bool;
var result_8 : int;
var i_9 : int;
var current_10 : int;
var break_11 : bool;
var result_12 : int;
var i_13 : int;
var current_14 : int;
var break_15 : bool;


procedure thread1() returns ()
modifies nondet_0, name_1, name_2, name_3, result_4, i_5, current_6, break_7, result_8, i_9, current_10, break_11, result_12, i_13, current_14, break_15;
{
  atomic {
    i_5 := 0;
    break_7 := false;
    result_4 := ( if ( name_1 == name_2 ) then 0 else result_4 );
    break_7 := ( if ( name_1 == name_2 ) then true else break_7 );
  }
  while (*) {
    atomic {
      assume ( ( i_5 < 3 ) && !break_7 );
      current_6 := nondet_0[i_5];
      result_4 := ( if ( current_6 == name_1 ) then 1 else result_4 );
      break_7 := ( if ( current_6 == name_1 ) then true else break_7 );
      result_4 := ( if ( !break_7 && ( current_6 == name_2 ) ) then ( 0 - 1 ) else result_4 );
      break_7 := ( if ( !break_7 && ( current_6 == name_2 ) ) then true else break_7 );
      i_5 := ( i_5 + 1 );
    }
  }
  atomic {
    assume !( ( i_5 < 3 ) && !break_7 );
    result_4 := ( if !break_7 then ( name_1 - name_2 ) else result_4 );
  }
}

procedure thread2() returns ()
modifies nondet_0, name_1, name_2, name_3, result_4, i_5, current_6, break_7, result_8, i_9, current_10, break_11, result_12, i_13, current_14, break_15;
{
  atomic {
    i_9 := 0;
    break_11 := false;
    result_8 := ( if ( name_2 == name_3 ) then 0 else result_8 );
    break_11 := ( if ( name_2 == name_3 ) then true else break_11 );
  }
  while (*) {
    atomic {
      assume ( ( i_9 < 3 ) && !break_11 );
      current_10 := nondet_0[i_9];
      result_8 := ( if ( current_10 == name_2 ) then 1 else result_8 );
      break_11 := ( if ( current_10 == name_2 ) then true else break_11 );
      result_8 := ( if ( !break_11 && ( current_10 == name_3 ) ) then ( 0 - 1 ) else result_8 );
      break_11 := ( if ( !break_11 && ( current_10 == name_3 ) ) then true else break_11 );
      i_9 := ( i_9 + 1 );
    }
  }
  atomic {
    assume !( ( i_9 < 3 ) && !break_11 );
    result_8 := ( if !break_11 then ( name_2 - name_3 ) else result_8 );
  }
}

procedure thread3() returns ()
modifies nondet_0, name_1, name_2, name_3, result_4, i_5, current_6, break_7, result_8, i_9, current_10, break_11, result_12, i_13, current_14, break_15;
{
  atomic {
    i_13 := 0;
    break_15 := false;
    result_12 := ( if ( name_1 == name_3 ) then 0 else result_12 );
    break_15 := ( if ( name_1 == name_3 ) then true else break_15 );
  }
  while (*) {
    atomic {
      assume ( ( i_13 < 3 ) && !break_15 );
      current_14 := nondet_0[i_13];
      result_12 := ( if ( current_14 == name_1 ) then 1 else result_12 );
      break_15 := ( if ( current_14 == name_1 ) then true else break_15 );
      result_12 := ( if ( !break_15 && ( current_14 == name_3 ) ) then ( 0 - 1 ) else result_12 );
      break_15 := ( if ( !break_15 && ( current_14 == name_3 ) ) then true else break_15 );
      i_13 := ( i_13 + 1 );
    }
  }
  atomic {
    assume !( ( i_13 < 3 ) && !break_15 );
    result_12 := ( if !break_15 then ( name_1 - name_3 ) else result_12 );
  }
}

procedure ULTIMATE.start() returns ()
modifies nondet_0, name_1, name_2, name_3, result_4, i_5, current_6, break_7, result_8, i_9, current_10, break_11, result_12, i_13, current_14, break_15;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( ( result_4 > 0 ) && ( result_8 > 0 ) ) ==> ( result_12 > 0 ) );
  assert false; // should be unreachable
}
