//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/file-item-symm.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var isNull_0 : bool;
var filename_1 : int;
var filename_2 : bool;
var isNull_3 : bool;
var filename_4 : int;
var filename_5 : bool;
var result_6 : int;
var result_7 : int;


procedure thread1() returns ()
modifies isNull_0, filename_1, filename_2, isNull_3, filename_4, filename_5, result_6, result_7;
{
  result_6 := ( if isNull_0 then ( if isNull_3 then 0 else 1 ) else ( if isNull_3 then ( 0 - 1 ) else ( if filename_2 then ( if filename_5 then 0 else 1 ) else ( if filename_5 then ( 0 - 1 ) else ( filename_1 - filename_4 ) ) ) ) );
}

procedure thread2() returns ()
modifies isNull_0, filename_1, filename_2, isNull_3, filename_4, filename_5, result_6, result_7;
{
  result_7 := ( if isNull_3 then ( if isNull_0 then 0 else 1 ) else ( if isNull_0 then ( 0 - 1 ) else ( if filename_5 then ( if filename_2 then 0 else 1 ) else ( if filename_2 then ( 0 - 1 ) else ( filename_4 - filename_1 ) ) ) ) );
}

procedure ULTIMATE.start() returns ()
modifies isNull_0, filename_1, filename_2, isNull_3, filename_4, filename_5, result_6, result_7;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_6 < 0 ) then ( - 1 ) else ( if ( result_6 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_7 < 0 ) then ( - 1 ) else ( if ( result_7 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
