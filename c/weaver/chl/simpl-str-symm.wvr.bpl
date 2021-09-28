//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/simpl-str-symm.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var length_0 : int;
var to_int_1 : int;
var length_2 : int;
var to_int_3 : int;
var result_4 : int;
var result_5 : int;


procedure thread1() returns ()
modifies length_0, to_int_1, length_2, to_int_3, result_4, result_5;
{
  result_4 := ( if ( length_0 == 0 ) then ( if ( length_2 == 0 ) then 0 else 1 ) else ( if ( length_2 == 0 ) then ( 0 - 1 ) else ( to_int_1 - to_int_3 ) ) );
}

procedure thread2() returns ()
modifies length_0, to_int_1, length_2, to_int_3, result_4, result_5;
{
  result_5 := ( if ( length_2 == 0 ) then ( if ( length_0 == 0 ) then 0 else 1 ) else ( if ( length_0 == 0 ) then ( 0 - 1 ) else ( to_int_3 - to_int_1 ) ) );
}

procedure ULTIMATE.start() returns ()
modifies length_0, to_int_1, length_2, to_int_3, result_4, result_5;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_4 < 0 ) then ( - 1 ) else ( if ( result_4 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_5 < 0 ) then ( - 1 ) else ( if ( result_5 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
