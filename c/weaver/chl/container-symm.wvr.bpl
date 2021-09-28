//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/container-symm.wvr'.
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
var result_8 : int;
var result_9 : int;


procedure thread1() returns ()
modifies departure_time_0, departure_max_duration_1, departure_transport_company_2, departure_transport_type_3, departure_time_4, departure_max_duration_5, departure_transport_company_6, departure_transport_type_7, result_8, result_9;
{
  atomic {
    result_8 := ( departure_time_0 - departure_time_4 );
    result_8 := ( if ( result_8 == 0 ) then ( departure_max_duration_1 - departure_max_duration_5 ) else result_8 );
    result_8 := ( if ( result_8 == 0 ) then ( departure_transport_company_2 - departure_transport_company_6 ) else result_8 );
    result_8 := ( if ( result_8 == 0 ) then ( departure_transport_type_3 - departure_transport_type_7 ) else result_8 );
  }
}

procedure thread2() returns ()
modifies departure_time_0, departure_max_duration_1, departure_transport_company_2, departure_transport_type_3, departure_time_4, departure_max_duration_5, departure_transport_company_6, departure_transport_type_7, result_8, result_9;
{
  atomic {
    result_9 := ( departure_time_4 - departure_time_0 );
    result_9 := ( if ( result_9 == 0 ) then ( departure_max_duration_5 - departure_max_duration_1 ) else result_9 );
    result_9 := ( if ( result_9 == 0 ) then ( departure_transport_company_6 - departure_transport_company_2 ) else result_9 );
    result_9 := ( if ( result_9 == 0 ) then ( departure_transport_type_7 - departure_transport_type_3 ) else result_9 );
  }
}

procedure ULTIMATE.start() returns ()
modifies departure_time_0, departure_max_duration_1, departure_transport_company_2, departure_transport_type_3, departure_time_4, departure_max_duration_5, departure_transport_company_6, departure_transport_type_7, result_8, result_9;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_8 < 0 ) then ( - 1 ) else ( if ( result_8 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_9 < 0 ) then ( - 1 ) else ( if ( result_9 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
