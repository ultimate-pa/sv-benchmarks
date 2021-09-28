//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/nzb-file-symm.wvr'.
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
var result_8 : int;
var i_9 : int;
var break_10 : bool;
var result_11 : int;
var i_12 : int;
var break_13 : bool;


procedure thread1() returns ()
modifies filename_0, is_null_1, ends_with_2, get_subject_3, filename_4, is_null_5, ends_with_6, get_subject_7, result_8, i_9, break_10, result_11, i_12, break_13;
{
  if (*) {
    atomic {
      assume ( !is_null_1 && !is_null_5 );
      i_9 := 0;
      break_10 := false;
    }
    while (*) {
      atomic {
        assume ( ( i_9 < 5 ) && !break_10 );
        result_8 := ( if ( ends_with_2[i_9] && ends_with_6[i_9] ) then 0 else result_8 );
        break_10 := ( if ( ends_with_2[i_9] && ends_with_6[i_9] ) then true else break_10 );
        result_8 := ( if ( !break_10 && ends_with_2[i_9] ) then ( ( 0 - 1000 ) + i_9 ) else result_8 );
        break_10 := ( if ( !break_10 && ends_with_2[i_9] ) then true else break_10 );
        result_8 := ( if ( !break_10 && ends_with_6[i_9] ) then ( 1000 + i_9 ) else result_8 );
        break_10 := ( if ( !break_10 && ends_with_6[i_9] ) then true else break_10 );
        i_9 := ( i_9 + 1 );
      }
    }
    atomic {
      assume !( ( i_9 < 5 ) && !break_10 );
      result_8 := ( if !break_10 then ( filename_0 - filename_4 ) else result_8 );
    }
  }
  else {
    atomic {
      assume !( !is_null_1 && !is_null_5 );
      result_8 := ( if ( !is_null_1 && is_null_5 ) then ( 0 - 995 ) else ( if ( is_null_1 && !is_null_5 ) then 1005 else ( get_subject_3 - get_subject_7 ) ) );
    }
  }
}

procedure thread2() returns ()
modifies filename_0, is_null_1, ends_with_2, get_subject_3, filename_4, is_null_5, ends_with_6, get_subject_7, result_8, i_9, break_10, result_11, i_12, break_13;
{
  if (*) {
    atomic {
      assume ( !is_null_5 && !is_null_1 );
      i_12 := 0;
      break_13 := false;
    }
    while (*) {
      atomic {
        assume ( ( i_12 < 5 ) && !break_13 );
        result_11 := ( if ( ends_with_6[i_12] && ends_with_2[i_12] ) then 0 else result_11 );
        break_13 := ( if ( ends_with_6[i_12] && ends_with_2[i_12] ) then true else break_13 );
        result_11 := ( if ( !break_13 && ends_with_6[i_12] ) then ( ( 0 - 1000 ) + i_12 ) else result_11 );
        break_13 := ( if ( !break_13 && ends_with_6[i_12] ) then true else break_13 );
        result_11 := ( if ( !break_13 && ends_with_2[i_12] ) then ( 1000 + i_12 ) else result_11 );
        break_13 := ( if ( !break_13 && ends_with_2[i_12] ) then true else break_13 );
        i_12 := ( i_12 + 1 );
      }
    }
    atomic {
      assume !( ( i_12 < 5 ) && !break_13 );
      result_11 := ( if !break_13 then ( filename_4 - filename_0 ) else result_11 );
    }
  }
  else {
    atomic {
      assume !( !is_null_5 && !is_null_1 );
      result_11 := ( if ( !is_null_5 && is_null_1 ) then ( 0 - 995 ) else ( if ( is_null_5 && !is_null_1 ) then 1005 else ( get_subject_7 - get_subject_3 ) ) );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies filename_0, is_null_1, ends_with_2, get_subject_3, filename_4, is_null_5, ends_with_6, get_subject_7, result_8, i_9, break_10, result_11, i_12, break_13;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_8 < 0 ) then ( - 1 ) else ( if ( result_8 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_11 < 0 ) then ( - 1 ) else ( if ( result_11 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
