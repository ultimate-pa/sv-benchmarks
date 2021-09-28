//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/mult-dist.wvr'.
*
* Generated: 2021-02-25T09:33:25.
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
  while (( i_1 < a )) {
    atomic {
      x_1 := ( x_1 + c );
      i_1 := ( i_1 + 1 );
    }
  }
}

procedure thread2() returns ()
modifies x_1, x_2, x_3, i_1, i_2, i_3, a, b, c;
{
  while (( i_2 < b )) {
    atomic {
      x_2 := ( x_2 + c );
      i_2 := ( i_2 + 1 );
    }
  }
}

procedure thread3() returns ()
modifies x_1, x_2, x_3, i_1, i_2, i_3, a, b, c;
{
  while (( i_3 < ( a + b ) )) {
    atomic {
      x_3 := ( x_3 + c );
      i_3 := ( i_3 + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies x_1, x_2, x_3, i_1, i_2, i_3, a, b, c;
{
  assume ( ( x_1 == x_2 && x_1 == x_3 && x_1 == i_1 && x_1 == i_2 && x_1 == i_3 && x_1 == 0 ) && ( a >= 0 ) && ( b >= 0 ) && ( c >= 0 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( x_1 + x_2 ) == x_3 );
  assert false; // should be unreachable
}
