//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/node-subst.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var id_0 : int;
var contains_key_1 : [int] bool;
var get_2 : [int] int;
var id_3 : int;
var contains_key_4 : [int] bool;
var get_5 : [int] int;
var id_6 : int;
var contains_key_7 : [int] bool;
var get_8 : [int] int;
var result_9 : int;
var order1_10 : int;
var order2_11 : int;
var result_12 : int;
var order1_13 : int;
var order2_14 : int;
var result_15 : int;
var order1_16 : int;
var order2_17 : int;


procedure thread1() returns ()
modifies id_0, contains_key_1, get_2, id_3, contains_key_4, get_5, id_6, contains_key_7, get_8, result_9, order1_10, order2_11, result_12, order1_13, order2_14, result_15, order1_16, order2_17;
{
  atomic {
    order1_10 := get_2[id_0];
    order2_11 := get_5[id_3];
    result_9 := ( if ( contains_key_1[id_0] && contains_key_4[id_3] ) then ( if ( order1_10 < order2_11 ) then ( 0 - 1 ) else ( if ( order1_10 > order2_11 ) then 1 else 0 ) ) else ( get_2[id_0] - get_5[id_3] ) );
  }
}

procedure thread2() returns ()
modifies id_0, contains_key_1, get_2, id_3, contains_key_4, get_5, id_6, contains_key_7, get_8, result_9, order1_10, order2_11, result_12, order1_13, order2_14, result_15, order1_16, order2_17;
{
  atomic {
    order1_13 := get_2[id_0];
    order2_14 := get_8[id_6];
    result_12 := ( if ( contains_key_1[id_0] && contains_key_7[id_6] ) then ( if ( order1_13 < order2_14 ) then ( 0 - 1 ) else ( if ( order1_13 > order2_14 ) then 1 else 0 ) ) else ( get_2[id_0] - get_8[id_6] ) );
  }
}

procedure thread3() returns ()
modifies id_0, contains_key_1, get_2, id_3, contains_key_4, get_5, id_6, contains_key_7, get_8, result_9, order1_10, order2_11, result_12, order1_13, order2_14, result_15, order1_16, order2_17;
{
  atomic {
    order1_16 := get_5[id_3];
    order2_17 := get_8[id_6];
    result_15 := ( if ( contains_key_4[id_3] && contains_key_7[id_6] ) then ( if ( order1_16 < order2_17 ) then ( 0 - 1 ) else ( if ( order1_16 > order2_17 ) then 1 else 0 ) ) else ( get_5[id_3] - get_8[id_6] ) );
  }
}

procedure ULTIMATE.start() returns ()
modifies id_0, contains_key_1, get_2, id_3, contains_key_4, get_5, id_6, contains_key_7, get_8, result_9, order1_10, order2_11, result_12, order1_13, order2_14, result_15, order1_16, order2_17;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( result_9 == 0 ) ==> ( ( ( result_12 > 0 ) == ( result_15 > 0 ) ) && ( ( result_12 < 0 ) == ( result_15 < 0 ) ) ) );
  assert false; // should be unreachable
}
