//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/exp-term-symm.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var sort_label_0 : int;
var sort_label_is_null_1 : bool;
var sort_label_2 : int;
var sort_label_is_null_3 : bool;
var result_4 : int;
var result_5 : int;


procedure thread1() returns ()
modifies sort_label_0, sort_label_is_null_1, sort_label_2, sort_label_is_null_3, result_4, result_5;
{
  result_4 := ( if ( ( sort_label_is_null_1 == sort_label_is_null_3 ) && ( ( !sort_label_is_null_1 && !sort_label_is_null_3 ) ==> ( sort_label_0 == sort_label_2 ) ) ) then 0 else ( if sort_label_is_null_1 then ( 0 - 1 ) else ( if sort_label_is_null_3 then 1 else ( sort_label_0 - sort_label_2 ) ) ) );
}

procedure thread2() returns ()
modifies sort_label_0, sort_label_is_null_1, sort_label_2, sort_label_is_null_3, result_4, result_5;
{
  result_5 := ( if ( ( sort_label_is_null_3 == sort_label_is_null_1 ) && ( ( !sort_label_is_null_3 && !sort_label_is_null_1 ) ==> ( sort_label_2 == sort_label_0 ) ) ) then 0 else ( if sort_label_is_null_3 then ( 0 - 1 ) else ( if sort_label_is_null_1 then 1 else ( sort_label_2 - sort_label_0 ) ) ) );
}

procedure ULTIMATE.start() returns ()
modifies sort_label_0, sort_label_is_null_1, sort_label_2, sort_label_is_null_3, result_4, result_5;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_4 < 0 ) then ( - 1 ) else ( if ( result_4 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_5 < 0 ) then ( - 1 ) else ( if ( result_5 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
