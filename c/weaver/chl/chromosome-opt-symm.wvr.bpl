//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/chromosome-opt-symm.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var scoreA : [int] int;
var scoreB : [int] int;
var isNullA : int;
var isNullB : int;
var comp_1 : int;
var i_1 : int;
var result_1 : int;
var continue_1 : bool;
var comp_2 : int;
var i_2 : int;
var result_2 : int;
var continue_2 : bool;


procedure thread1() returns ()
modifies scoreA, scoreB, isNullA, isNullB, comp_1, i_1, result_1, continue_1, comp_2, i_2, result_2, continue_2;
{
  atomic {
    continue_1 := true;
    assume !( isNullA == 0 );
    continue_1 := ( if ( isNullB == 0 ) then false else continue_1 );
    comp_1 := ( if continue_1 then 0 else comp_1 );
    i_1 := ( if continue_1 then 0 else i_1 );
  }
  while (*) {
    atomic {
      assume ( continue_1 && ( i_1 < 5 ) );
      comp_1 := ( if ( scoreA[i_1] < scoreB[i_1] ) then ( - 1 ) else ( if ( scoreA[i_1] > scoreB[i_1] ) then 1 else 0 ) );
      result_1 := ( if !( comp_1 == 0 ) then comp_1 else result_1 );
      continue_1 := ( if !( comp_1 == 0 ) then false else continue_1 );
      i_1 := ( if !( comp_1 == 0 ) then i_1 else ( i_1 + 1 ) );
    }
  }
  atomic {
    assume !( continue_1 && ( i_1 < 5 ) );
    result_1 := ( if continue_1 then 0 else result_1 );
  }
}

procedure thread2() returns ()
modifies scoreA, scoreB, isNullA, isNullB, comp_1, i_1, result_1, continue_1, comp_2, i_2, result_2, continue_2;
{
  atomic {
    continue_2 := true;
    assume !( isNullB == 0 );
    continue_2 := ( if ( isNullA == 0 ) then false else continue_2 );
    comp_2 := ( if continue_2 then 0 else comp_2 );
    i_2 := ( if continue_2 then 0 else i_2 );
  }
  while (*) {
    atomic {
      assume ( continue_2 && ( i_2 < 5 ) );
      comp_2 := ( if ( scoreB[i_2] < scoreA[i_2] ) then ( - 1 ) else ( if ( scoreB[i_2] > scoreA[i_2] ) then 1 else 0 ) );
      result_2 := ( if !( comp_2 == 0 ) then comp_2 else result_2 );
      continue_2 := ( if !( comp_2 == 0 ) then false else continue_2 );
      i_2 := ( if !( comp_2 == 0 ) then i_2 else ( i_2 + 1 ) );
    }
  }
  atomic {
    assume !( continue_2 && ( i_2 < 5 ) );
    result_2 := ( if continue_2 then 0 else result_2 );
  }
}

procedure ULTIMATE.start() returns ()
modifies scoreA, scoreB, isNullA, isNullB, comp_1, i_1, result_1, continue_1, comp_2, i_2, result_2, continue_2;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( result_1 == ( - result_2 ) );
  assert false; // should be unreachable
}
