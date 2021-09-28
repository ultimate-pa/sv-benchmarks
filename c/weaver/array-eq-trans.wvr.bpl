//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/array-eq-trans.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var A : [int] int;
var B : [int] int;
var C : [int] int;
var i_AB : int;
var i_BC : int;
var i_AC : int;
var An : int;
var Bn : int;
var Cn : int;
var break_AB : bool;
var break_BC : bool;
var break_AC : bool;


procedure thread1() returns ()
modifies A, B, C, i_AB, i_BC, i_AC, An, Bn, Cn, break_AB, break_BC, break_AC;
{
  while (( ( i_AB < An ) && ( i_AB < Bn ) && !break_AB )) {
    if (( A[i_AB] == B[i_AB] )) {
      i_AB := ( i_AB + 1 );

    }
    else {
      break_AB := true;

    }
  }
}

procedure thread2() returns ()
modifies A, B, C, i_AB, i_BC, i_AC, An, Bn, Cn, break_AB, break_BC, break_AC;
{
  while (( ( i_BC < Bn ) && ( i_BC < Cn ) && !break_BC )) {
    if (( B[i_BC] == C[i_BC] )) {
      i_BC := ( i_BC + 1 );

    }
    else {
      break_BC := true;

    }
  }
}

procedure thread3() returns ()
modifies A, B, C, i_AB, i_BC, i_AC, An, Bn, Cn, break_AB, break_BC, break_AC;
{
  while (( ( i_AC < An ) && ( i_AC < Cn ) && !break_AC )) {
    if (( A[i_AC] == C[i_AC] )) {
      i_AC := ( i_AC + 1 );

    }
    else {
      break_AC := true;

    }
  }
}

procedure ULTIMATE.start() returns ()
modifies A, B, C, i_AB, i_BC, i_AC, An, Bn, Cn, break_AB, break_BC, break_AC;
{
  assume ( ( i_AB == i_BC && i_AB == i_AC && i_AB == 0 ) && ( break_AB == break_BC && break_AB == break_AC && break_AB == false ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( ( i_AB == An ) || ( ( i_AB < Bn ) && ( A[i_AB] <= B[i_AB] ) ) ) ==> ( ( i_BC == Bn ) || ( ( i_BC < Cn ) && ( B[i_BC] <= C[i_BC] ) ) ) ==> ( ( i_AC == An ) || ( ( i_AC < Cn ) && ( A[i_AC] <= C[i_AC] ) ) ) );
  assert false; // should be unreachable
}
