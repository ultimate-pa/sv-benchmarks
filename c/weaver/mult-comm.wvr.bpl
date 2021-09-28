//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/mult-comm.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var x_1 : int;
var x_2 : int;
var x_3 : int;
var i_1 : int;
var i_2 : int;
var i_3 : int;
var a : int;
var b : int;
var c : int;


procedure thread1() returns ()
modifies x_1, x_2, x_3, i_1, i_2, i_3, a, b, c;
{
  while (( i_1 < b )) {
    atomic {
      x_1 := ( x_1 + a );
      i_1 := ( i_1 + 1 );
    }
  }
}

procedure thread2() returns ()
modifies x_1, x_2, x_3, i_1, i_2, i_3, a, b, c;
{
  while (( i_2 < a )) {
    atomic {
      x_2 := ( x_2 + b );
      i_2 := ( i_2 + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies x_1, x_2, x_3, i_1, i_2, i_3, a, b, c;
{
  assume ( ( b >= 0 ) && ( a >= 0 ) && ( x_1 == x_2 && x_1 == x_3 && x_1 == i_1 && x_1 == i_2 && x_1 == i_3 && x_1 == 0 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( x_1 == x_2 );
  assert false; // should be unreachable
}
