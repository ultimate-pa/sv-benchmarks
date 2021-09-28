//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/array-eq-symm.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var A : [int] int;
var B : [int] int;
var i_AB : int;
var i_BA : int;
var An : int;
var Bn : int;
var break_AB : bool;
var break_BA : bool;


procedure thread1() returns ()
modifies A, B, i_AB, i_BA, An, Bn, break_AB, break_BA;
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
modifies A, B, i_AB, i_BA, An, Bn, break_AB, break_BA;
{
  while (( ( i_BA < Bn ) && ( i_BA < An ) && !break_BA )) {
    if (( B[i_BA] == A[i_BA] )) {
      i_BA := ( i_BA + 1 );

    }
    else {
      break_BA := true;

    }
  }
}

procedure ULTIMATE.start() returns ()
modifies A, B, i_AB, i_BA, An, Bn, break_AB, break_BA;
{
  assume ( ( i_AB == i_BA && i_AB == 0 ) && ( break_AB == break_BA && break_AB == false ) );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( i_AB == i_BA );
  assert false; // should be unreachable
}
