//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/node-symm.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var id_0 : int;
var contains_key_1 : [int] bool;
var get_2 : [int] int;
var id_3 : int;
var contains_key_4 : [int] bool;
var get_5 : [int] int;
var result_6 : int;
var order1_7 : int;
var order2_8 : int;
var result_9 : int;
var order1_10 : int;
var order2_11 : int;


procedure thread1() returns ()
modifies id_0, contains_key_1, get_2, id_3, contains_key_4, get_5, result_6, order1_7, order2_8, result_9, order1_10, order2_11;
{
  atomic {
    order1_7 := get_2[id_0];
    order2_8 := get_5[id_3];
    result_6 := ( if ( contains_key_1[id_0] && contains_key_4[id_3] ) then ( if ( order1_7 < order2_8 ) then ( 0 - 1 ) else ( if ( order1_7 > order2_8 ) then 1 else 0 ) ) else ( get_2[id_0] - get_5[id_3] ) );
  }
}

procedure thread2() returns ()
modifies id_0, contains_key_1, get_2, id_3, contains_key_4, get_5, result_6, order1_7, order2_8, result_9, order1_10, order2_11;
{
  atomic {
    order1_10 := get_5[id_3];
    order2_11 := get_2[id_0];
    result_9 := ( if ( contains_key_4[id_3] && contains_key_1[id_0] ) then ( if ( order1_10 < order2_11 ) then ( 0 - 1 ) else ( if ( order1_10 > order2_11 ) then 1 else 0 ) ) else ( get_5[id_3] - get_2[id_0] ) );
  }
}

procedure ULTIMATE.start() returns ()
modifies id_0, contains_key_1, get_2, id_3, contains_key_4, get_5, result_6, order1_7, order2_8, result_9, order1_10, order2_11;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_6 < 0 ) then ( - 1 ) else ( if ( result_6 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_9 < 0 ) then ( - 1 ) else ( if ( result_9 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
