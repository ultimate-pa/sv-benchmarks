//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/bench/exp3x3-opt.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var x1 : int;
var x2 : int;
var x3 : int;
var x4 : int;
var x5 : int;
var x6 : int;
var n : int;


procedure thread1() returns ()
modifies x1, x2, x3, x4, x5, x6, n;
{
  while (*) {
    atomic {
      assume ( x1 < n );
      x1 := ( x1 + x1 );
    }
  }
}

procedure thread2() returns ()
modifies x1, x2, x3, x4, x5, x6, n;
{
  while (*) {
    atomic {
      assume ( x2 < n );
      x2 := ( x2 + x2 );
    }
  }
}

procedure thread3() returns ()
modifies x1, x2, x3, x4, x5, x6, n;
{
  while (*) {
    atomic {
      assume ( x3 < n );
      x3 := ( x3 + x3 );
    }
  }
}

procedure thread4() returns ()
modifies x1, x2, x3, x4, x5, x6, n;
{
  while (*) {
    atomic {
      assume ( x4 < n );
      x4 := ( x4 + x4 );
    }
  }
}

procedure thread5() returns ()
modifies x1, x2, x3, x4, x5, x6, n;
{
  while (*) {
    atomic {
      assume ( x5 < n );
      x5 := ( x5 + x5 );
    }
  }
}

procedure thread6() returns ()
modifies x1, x2, x3, x4, x5, x6, n;
{
  while (*) {
    atomic {
      assume ( x6 < n );
      x6 := ( x6 + x6 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies x1, x2, x3, x4, x5, x6, n;
{
  assume ( ( x1 == x2 ) && ( x3 == x4 ) && ( x5 == x6 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  fork 4,4,4,4 thread4();
  fork 5,5,5,5,5 thread5();
  fork 6,6,6,6,6,6 thread6();
  join 1;
  join 2,2;
  join 3,3,3;
  join 4,4,4,4;
  join 5,5,5,5,5;
  join 6,6,6,6,6,6;
  assume ( ( x1 >= n ) && ( x2 >= n ) && !( x1 == x2 ) && ( x3 >= n ) && ( x4 >= n ) && !( x3 == x4 ) && ( x5 >= n ) && ( x6 >= n ) && !( x5 == x6 ) );
  assert false; // should be unreachable
}
