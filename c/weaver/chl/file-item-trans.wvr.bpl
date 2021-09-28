//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/file-item-trans.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var isNull_0 : bool;
var filename_1 : int;
var filename_2 : bool;
var isNull_3 : bool;
var filename_4 : int;
var filename_5 : bool;
var isNull_6 : bool;
var filename_7 : int;
var filename_8 : bool;
var result_9 : int;
var result_10 : int;
var result_11 : int;


procedure thread1() returns ()
modifies isNull_0, filename_1, filename_2, isNull_3, filename_4, filename_5, isNull_6, filename_7, filename_8, result_9, result_10, result_11;
{
  result_9 := ( if isNull_0 then ( if isNull_3 then 0 else 1 ) else ( if isNull_3 then ( 0 - 1 ) else ( if filename_2 then ( if filename_5 then 0 else 1 ) else ( if filename_5 then ( 0 - 1 ) else ( filename_1 - filename_4 ) ) ) ) );
}

procedure thread2() returns ()
modifies isNull_0, filename_1, filename_2, isNull_3, filename_4, filename_5, isNull_6, filename_7, filename_8, result_9, result_10, result_11;
{
  result_10 := ( if isNull_3 then ( if isNull_6 then 0 else 1 ) else ( if isNull_6 then ( 0 - 1 ) else ( if filename_5 then ( if filename_8 then 0 else 1 ) else ( if filename_8 then ( 0 - 1 ) else ( filename_4 - filename_7 ) ) ) ) );
}

procedure thread3() returns ()
modifies isNull_0, filename_1, filename_2, isNull_3, filename_4, filename_5, isNull_6, filename_7, filename_8, result_9, result_10, result_11;
{
  result_11 := ( if isNull_0 then ( if isNull_6 then 0 else 1 ) else ( if isNull_6 then ( 0 - 1 ) else ( if filename_2 then ( if filename_8 then 0 else 1 ) else ( if filename_8 then ( 0 - 1 ) else ( filename_1 - filename_7 ) ) ) ) );
}

procedure ULTIMATE.start() returns ()
modifies isNull_0, filename_1, filename_2, isNull_3, filename_4, filename_5, isNull_6, filename_7, filename_8, result_9, result_10, result_11;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( ( result_9 > 0 ) && ( result_10 > 0 ) ) ==> ( result_11 > 0 ) );
  assert false; // should be unreachable
}
