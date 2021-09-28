//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/simpl-str-trans.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var length_0 : int;
var to_int_1 : int;
var length_2 : int;
var to_int_3 : int;
var length_4 : int;
var to_int_5 : int;
var result_6 : int;
var result_7 : int;
var result_8 : int;


procedure thread1() returns ()
modifies length_0, to_int_1, length_2, to_int_3, length_4, to_int_5, result_6, result_7, result_8;
{
  result_6 := ( if ( length_0 == 0 ) then ( if ( length_2 == 0 ) then 0 else 1 ) else ( if ( length_2 == 0 ) then ( 0 - 1 ) else ( to_int_1 - to_int_3 ) ) );
}

procedure thread2() returns ()
modifies length_0, to_int_1, length_2, to_int_3, length_4, to_int_5, result_6, result_7, result_8;
{
  result_7 := ( if ( length_2 == 0 ) then ( if ( length_4 == 0 ) then 0 else 1 ) else ( if ( length_4 == 0 ) then ( 0 - 1 ) else ( to_int_3 - to_int_5 ) ) );
}

procedure thread3() returns ()
modifies length_0, to_int_1, length_2, to_int_3, length_4, to_int_5, result_6, result_7, result_8;
{
  result_8 := ( if ( length_0 == 0 ) then ( if ( length_4 == 0 ) then 0 else 1 ) else ( if ( length_4 == 0 ) then ( 0 - 1 ) else ( to_int_1 - to_int_5 ) ) );
}

procedure ULTIMATE.start() returns ()
modifies length_0, to_int_1, length_2, to_int_3, length_4, to_int_5, result_6, result_7, result_8;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( ( result_6 > 0 ) && ( result_7 > 0 ) ) ==> ( result_8 > 0 ) );
  assert false; // should be unreachable
}
