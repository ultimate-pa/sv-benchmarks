//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/exp-term-subst.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var sort_label_0 : int;
var sort_label_is_null_1 : bool;
var sort_label_2 : int;
var sort_label_is_null_3 : bool;
var sort_label_4 : int;
var sort_label_is_null_5 : bool;
var result_6 : int;
var result_7 : int;
var result_8 : int;


procedure thread1() returns ()
modifies sort_label_0, sort_label_is_null_1, sort_label_2, sort_label_is_null_3, sort_label_4, sort_label_is_null_5, result_6, result_7, result_8;
{
  result_6 := ( if ( ( sort_label_is_null_1 == sort_label_is_null_3 ) && ( ( !sort_label_is_null_1 && !sort_label_is_null_3 ) ==> ( sort_label_0 == sort_label_2 ) ) ) then 0 else ( if sort_label_is_null_1 then ( 0 - 1 ) else ( if sort_label_is_null_3 then 1 else ( sort_label_0 - sort_label_2 ) ) ) );
}

procedure thread2() returns ()
modifies sort_label_0, sort_label_is_null_1, sort_label_2, sort_label_is_null_3, sort_label_4, sort_label_is_null_5, result_6, result_7, result_8;
{
  result_7 := ( if ( ( sort_label_is_null_1 == sort_label_is_null_5 ) && ( ( !sort_label_is_null_1 && !sort_label_is_null_5 ) ==> ( sort_label_0 == sort_label_4 ) ) ) then 0 else ( if sort_label_is_null_1 then ( 0 - 1 ) else ( if sort_label_is_null_5 then 1 else ( sort_label_0 - sort_label_4 ) ) ) );
}

procedure thread3() returns ()
modifies sort_label_0, sort_label_is_null_1, sort_label_2, sort_label_is_null_3, sort_label_4, sort_label_is_null_5, result_6, result_7, result_8;
{
  result_8 := ( if ( ( sort_label_is_null_3 == sort_label_is_null_5 ) && ( ( !sort_label_is_null_3 && !sort_label_is_null_5 ) ==> ( sort_label_2 == sort_label_4 ) ) ) then 0 else ( if sort_label_is_null_3 then ( 0 - 1 ) else ( if sort_label_is_null_5 then 1 else ( sort_label_2 - sort_label_4 ) ) ) );
}

procedure ULTIMATE.start() returns ()
modifies sort_label_0, sort_label_is_null_1, sort_label_2, sort_label_is_null_3, sort_label_4, sort_label_is_null_5, result_6, result_7, result_8;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( result_6 == 0 ) ==> ( ( ( result_7 > 0 ) == ( result_8 > 0 ) ) && ( ( result_7 < 0 ) == ( result_8 < 0 ) ) ) );
  assert false; // should be unreachable
}
