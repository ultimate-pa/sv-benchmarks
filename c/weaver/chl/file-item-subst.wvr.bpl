//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/file-item-subst.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var is_null_0 : bool;
var filename_1 : int;
var filename_is_null_2 : bool;
var is_null_3 : bool;
var filename_4 : int;
var filename_is_null_5 : bool;
var is_null_6 : bool;
var filename_7 : int;
var filename_is_null_8 : bool;
var result_9 : int;
var result_10 : int;
var result_11 : int;


procedure thread1() returns ()
modifies is_null_0, filename_1, filename_is_null_2, is_null_3, filename_4, filename_is_null_5, is_null_6, filename_7, filename_is_null_8, result_9, result_10, result_11;
{
  result_9 := ( if is_null_0 then ( if is_null_3 then 0 else 1 ) else ( if is_null_3 then ( 0 - 1 ) else ( if filename_is_null_2 then ( if filename_is_null_5 then 0 else 1 ) else ( if filename_is_null_5 then ( 0 - 1 ) else ( filename_1 - filename_4 ) ) ) ) );
}

procedure thread2() returns ()
modifies is_null_0, filename_1, filename_is_null_2, is_null_3, filename_4, filename_is_null_5, is_null_6, filename_7, filename_is_null_8, result_9, result_10, result_11;
{
  result_10 := ( if is_null_0 then ( if is_null_6 then 0 else 1 ) else ( if is_null_6 then ( 0 - 1 ) else ( if filename_is_null_2 then ( if filename_is_null_8 then 0 else 1 ) else ( if filename_is_null_8 then ( 0 - 1 ) else ( filename_1 - filename_7 ) ) ) ) );
}

procedure thread3() returns ()
modifies is_null_0, filename_1, filename_is_null_2, is_null_3, filename_4, filename_is_null_5, is_null_6, filename_7, filename_is_null_8, result_9, result_10, result_11;
{
  result_11 := ( if is_null_3 then ( if is_null_6 then 0 else 1 ) else ( if is_null_6 then ( 0 - 1 ) else ( if filename_is_null_5 then ( if filename_is_null_8 then 0 else 1 ) else ( if filename_is_null_8 then ( 0 - 1 ) else ( filename_4 - filename_7 ) ) ) ) );
}

procedure ULTIMATE.start() returns ()
modifies is_null_0, filename_1, filename_is_null_2, is_null_3, filename_4, filename_is_null_5, is_null_6, filename_7, filename_is_null_8, result_9, result_10, result_11;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( result_9 == 0 ) ==> ( ( ( result_10 > 0 ) == ( result_11 > 0 ) ) && ( ( result_10 < 0 ) == ( result_11 < 0 ) ) ) );
  assert false; // should be unreachable
}
