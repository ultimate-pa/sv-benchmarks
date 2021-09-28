//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/sre-trans.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var sponsored_0 : bool;
var sponsored_1 : bool;
var sponsored_2 : bool;
var result_3 : int;
var result_4 : int;
var result_5 : int;


procedure thread1() returns ()
modifies sponsored_0, sponsored_1, sponsored_2, result_3, result_4, result_5;
{
  result_3 := ( if ( sponsored_0 == sponsored_1 ) then 0 else ( if sponsored_1 then ( 0 - 1 ) else 1 ) );
}

procedure thread2() returns ()
modifies sponsored_0, sponsored_1, sponsored_2, result_3, result_4, result_5;
{
  result_4 := ( if ( sponsored_1 == sponsored_2 ) then 0 else ( if sponsored_2 then ( 0 - 1 ) else 1 ) );
}

procedure thread3() returns ()
modifies sponsored_0, sponsored_1, sponsored_2, result_3, result_4, result_5;
{
  result_5 := ( if ( sponsored_0 == sponsored_2 ) then 0 else ( if sponsored_2 then ( 0 - 1 ) else 1 ) );
}

procedure ULTIMATE.start() returns ()
modifies sponsored_0, sponsored_1, sponsored_2, result_3, result_4, result_5;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( ( result_3 > 0 ) && ( result_4 > 0 ) ) ==> ( result_5 > 0 ) );
  assert false; // should be unreachable
}
