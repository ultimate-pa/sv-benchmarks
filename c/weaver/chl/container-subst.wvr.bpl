//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/container-subst.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var departure_time_0 : int;
var departure_max_duration_1 : int;
var departure_transport_company_2 : int;
var departure_transport_type_3 : int;
var departure_time_4 : int;
var departure_max_duration_5 : int;
var departure_transport_company_6 : int;
var departure_transport_type_7 : int;
var departure_time_8 : int;
var departure_max_duration_9 : int;
var departure_transport_company_10 : int;
var departure_transport_type_11 : int;
var result_12 : int;
var result_13 : int;
var result_14 : int;


procedure thread1() returns ()
modifies departure_time_0, departure_max_duration_1, departure_transport_company_2, departure_transport_type_3, departure_time_4, departure_max_duration_5, departure_transport_company_6, departure_transport_type_7, departure_time_8, departure_max_duration_9, departure_transport_company_10, departure_transport_type_11, result_12, result_13, result_14;
{
  atomic {
    result_12 := ( departure_time_0 - departure_time_4 );
    result_12 := ( if ( result_12 == 0 ) then ( departure_max_duration_1 - departure_max_duration_5 ) else result_12 );
    result_12 := ( if ( result_12 == 0 ) then ( departure_transport_company_2 - departure_transport_company_6 ) else result_12 );
    result_12 := ( if ( result_12 == 0 ) then ( departure_transport_type_3 - departure_transport_type_7 ) else result_12 );
  }
}

procedure thread2() returns ()
modifies departure_time_0, departure_max_duration_1, departure_transport_company_2, departure_transport_type_3, departure_time_4, departure_max_duration_5, departure_transport_company_6, departure_transport_type_7, departure_time_8, departure_max_duration_9, departure_transport_company_10, departure_transport_type_11, result_12, result_13, result_14;
{
  atomic {
    result_13 := ( departure_time_0 - departure_time_8 );
    result_13 := ( if ( result_13 == 0 ) then ( departure_max_duration_1 - departure_max_duration_9 ) else result_13 );
    result_13 := ( if ( result_13 == 0 ) then ( departure_transport_company_2 - departure_transport_company_10 ) else result_13 );
    result_13 := ( if ( result_13 == 0 ) then ( departure_transport_type_3 - departure_transport_type_11 ) else result_13 );
  }
}

procedure thread3() returns ()
modifies departure_time_0, departure_max_duration_1, departure_transport_company_2, departure_transport_type_3, departure_time_4, departure_max_duration_5, departure_transport_company_6, departure_transport_type_7, departure_time_8, departure_max_duration_9, departure_transport_company_10, departure_transport_type_11, result_12, result_13, result_14;
{
  atomic {
    result_14 := ( departure_time_4 - departure_time_8 );
    result_14 := ( if ( result_14 == 0 ) then ( departure_max_duration_5 - departure_max_duration_9 ) else result_14 );
    result_14 := ( if ( result_14 == 0 ) then ( departure_transport_company_6 - departure_transport_company_10 ) else result_14 );
    result_14 := ( if ( result_14 == 0 ) then ( departure_transport_type_7 - departure_transport_type_11 ) else result_14 );
  }
}

procedure ULTIMATE.start() returns ()
modifies departure_time_0, departure_max_duration_1, departure_transport_company_2, departure_transport_type_3, departure_time_4, departure_max_duration_5, departure_transport_company_6, departure_transport_type_7, departure_time_8, departure_max_duration_9, departure_transport_company_10, departure_transport_type_11, result_12, result_13, result_14;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( result_12 == 0 ) ==> ( ( ( result_13 > 0 ) == ( result_14 > 0 ) ) && ( ( result_13 < 0 ) == ( result_14 < 0 ) ) ) );
  assert false; // should be unreachable
}
