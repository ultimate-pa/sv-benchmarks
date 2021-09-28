//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/sre-symm.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var sponsored_0 : bool;
var sponsored_1 : bool;
var result_2 : int;
var result_3 : int;


procedure thread1() returns ()
modifies sponsored_0, sponsored_1, result_2, result_3;
{
  result_2 := ( if ( sponsored_0 == sponsored_1 ) then 0 else ( if sponsored_1 then ( 0 - 1 ) else 1 ) );
}

procedure thread2() returns ()
modifies sponsored_0, sponsored_1, result_2, result_3;
{
  result_3 := ( if ( sponsored_1 == sponsored_0 ) then 0 else ( if sponsored_0 then ( 0 - 1 ) else 1 ) );
}

procedure ULTIMATE.start() returns ()
modifies sponsored_0, sponsored_1, result_2, result_3;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_2 < 0 ) then ( - 1 ) else ( if ( result_2 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_3 < 0 ) then ( - 1 ) else ( if ( result_3 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
