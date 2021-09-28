//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/nzb-file-trans.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var filename_0 : int;
var is_null_1 : bool;
var ends_with_2 : [int] bool;
var get_subject_3 : int;
var filename_4 : int;
var is_null_5 : bool;
var ends_with_6 : [int] bool;
var get_subject_7 : int;
var filename_8 : int;
var is_null_9 : bool;
var ends_with_10 : [int] bool;
var get_subject_11 : int;
var result_12 : int;
var i_13 : int;
var break_14 : bool;
var result_15 : int;
var i_16 : int;
var break_17 : bool;
var result_18 : int;
var i_19 : int;
var break_20 : bool;


procedure thread1() returns ()
modifies filename_0, is_null_1, ends_with_2, get_subject_3, filename_4, is_null_5, ends_with_6, get_subject_7, filename_8, is_null_9, ends_with_10, get_subject_11, result_12, i_13, break_14, result_15, i_16, break_17, result_18, i_19, break_20;
{
  if (*) {
    atomic {
      assume ( !is_null_1 && !is_null_5 );
      i_13 := 0;
      break_14 := false;
    }
    while (*) {
      atomic {
        assume ( ( i_13 < 5 ) && !break_14 );
        result_12 := ( if ( ends_with_2[i_13] && ends_with_6[i_13] ) then 0 else result_12 );
        break_14 := ( if ( ends_with_2[i_13] && ends_with_6[i_13] ) then true else break_14 );
        result_12 := ( if ( !break_14 && ends_with_2[i_13] ) then ( ( 0 - 1000 ) + i_13 ) else result_12 );
        break_14 := ( if ( !break_14 && ends_with_2[i_13] ) then true else break_14 );
        result_12 := ( if ( !break_14 && ends_with_6[i_13] ) then ( 1000 + i_13 ) else result_12 );
        break_14 := ( if ( !break_14 && ends_with_6[i_13] ) then true else break_14 );
        i_13 := ( i_13 + 1 );
      }
    }
    atomic {
      assume !( ( i_13 < 5 ) && !break_14 );
      result_12 := ( if !break_14 then ( filename_0 - filename_4 ) else result_12 );
    }
  }
  else {
    atomic {
      assume !( !is_null_1 && !is_null_5 );
      result_12 := ( if ( !is_null_1 && is_null_5 ) then ( 0 - 995 ) else ( if ( is_null_1 && !is_null_5 ) then 1005 else ( get_subject_3 - get_subject_7 ) ) );
    }
  }
}

procedure thread2() returns ()
modifies filename_0, is_null_1, ends_with_2, get_subject_3, filename_4, is_null_5, ends_with_6, get_subject_7, filename_8, is_null_9, ends_with_10, get_subject_11, result_12, i_13, break_14, result_15, i_16, break_17, result_18, i_19, break_20;
{
  if (*) {
    atomic {
      assume ( !is_null_5 && !is_null_9 );
      i_16 := 0;
      break_17 := false;
    }
    while (*) {
      atomic {
        assume ( ( i_16 < 5 ) && !break_17 );
        result_15 := ( if ( ends_with_6[i_16] && ends_with_10[i_16] ) then 0 else result_15 );
        break_17 := ( if ( ends_with_6[i_16] && ends_with_10[i_16] ) then true else break_17 );
        result_15 := ( if ( !break_17 && ends_with_6[i_16] ) then ( ( 0 - 1000 ) + i_16 ) else result_15 );
        break_17 := ( if ( !break_17 && ends_with_6[i_16] ) then true else break_17 );
        result_15 := ( if ( !break_17 && ends_with_10[i_16] ) then ( 1000 + i_16 ) else result_15 );
        break_17 := ( if ( !break_17 && ends_with_10[i_16] ) then true else break_17 );
        i_16 := ( i_16 + 1 );
      }
    }
    atomic {
      assume !( ( i_16 < 5 ) && !break_17 );
      result_15 := ( if !break_17 then ( filename_4 - filename_8 ) else result_15 );
    }
  }
  else {
    atomic {
      assume !( !is_null_5 && !is_null_9 );
      result_15 := ( if ( !is_null_5 && is_null_9 ) then ( 0 - 995 ) else ( if ( is_null_5 && !is_null_9 ) then 1005 else ( get_subject_7 - get_subject_11 ) ) );
    }
  }
}

procedure thread3() returns ()
modifies filename_0, is_null_1, ends_with_2, get_subject_3, filename_4, is_null_5, ends_with_6, get_subject_7, filename_8, is_null_9, ends_with_10, get_subject_11, result_12, i_13, break_14, result_15, i_16, break_17, result_18, i_19, break_20;
{
  if (*) {
    atomic {
      assume ( !is_null_1 && !is_null_9 );
      i_19 := 0;
      break_20 := false;
    }
    while (*) {
      atomic {
        assume ( ( i_19 < 5 ) && !break_20 );
        result_18 := ( if ( ends_with_2[i_19] && ends_with_10[i_19] ) then 0 else result_18 );
        break_20 := ( if ( ends_with_2[i_19] && ends_with_10[i_19] ) then true else break_20 );
        result_18 := ( if ( !break_20 && ends_with_2[i_19] ) then ( ( 0 - 1000 ) + i_19 ) else result_18 );
        break_20 := ( if ( !break_20 && ends_with_2[i_19] ) then true else break_20 );
        result_18 := ( if ( !break_20 && ends_with_10[i_19] ) then ( 1000 + i_19 ) else result_18 );
        break_20 := ( if ( !break_20 && ends_with_10[i_19] ) then true else break_20 );
        i_19 := ( i_19 + 1 );
      }
    }
    atomic {
      assume !( ( i_19 < 5 ) && !break_20 );
      result_18 := ( if !break_20 then ( filename_0 - filename_8 ) else result_18 );
    }
  }
  else {
    atomic {
      assume !( !is_null_1 && !is_null_9 );
      result_18 := ( if ( !is_null_1 && is_null_9 ) then ( 0 - 995 ) else ( if ( is_null_1 && !is_null_9 ) then 1005 else ( get_subject_3 - get_subject_11 ) ) );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies filename_0, is_null_1, ends_with_2, get_subject_3, filename_4, is_null_5, ends_with_6, get_subject_7, filename_8, is_null_9, ends_with_10, get_subject_11, result_12, i_13, break_14, result_15, i_16, break_17, result_18, i_19, break_20;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( ( result_12 > 0 ) && ( result_15 > 0 ) ) ==> ( result_18 > 0 ) );
  assert false; // should be unreachable
}
