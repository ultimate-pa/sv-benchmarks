//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/parallel-sum-2.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var x : [int] int;
var i1 : int;
var i2 : int;
var t11 : int;
var t21 : int;
var t12 : int;
var t22 : int;
var s11 : int;
var s21 : int;
var s12 : int;
var s22 : int;
var x1 : int;
var x2 : int;
var n : int;


procedure thread2() returns ()
modifies x, i1, i2, t11, t21, t12, t22, s11, s21, s12, s22, x1, x2, n;
{
  while (*) {
    atomic {
      assume ( i1 < n );
      i1 := ( i1 + 1 );
      t11 := x[i1];
    }
    s11 := ( s11 + t11 );
  }
}

procedure thread3() returns ()
modifies x, i1, i2, t11, t21, t12, t22, s11, s21, s12, s22, x1, x2, n;
{
  while (*) {
    atomic {
      assume ( i1 < n );
      i1 := ( i1 + 1 );
      t21 := x[i1];
    }
    s21 := ( s21 + t21 );
  }
}

procedure thread1() returns ()
modifies x, i1, i2, t11, t21, t12, t22, s11, s21, s12, s22, x1, x2, n;
{
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 2,2;
  join 3,3,3;
  assume ( i1 == n );
  x1 := ( s11 + s21 );
}

procedure thread5() returns ()
modifies x, i1, i2, t11, t21, t12, t22, s11, s21, s12, s22, x1, x2, n;
{
  while (*) {
    atomic {
      assume ( i2 < n );
      i2 := ( i2 + 1 );
      t12 := x[i2];
    }
    s12 := ( s12 + t12 );
  }
}

procedure thread6() returns ()
modifies x, i1, i2, t11, t21, t12, t22, s11, s21, s12, s22, x1, x2, n;
{
  while (*) {
    atomic {
      assume ( i2 < n );
      i2 := ( i2 + 1 );
      t22 := x[i2];
    }
    s22 := ( s22 + t22 );
  }
}

procedure thread4() returns ()
modifies x, i1, i2, t11, t21, t12, t22, s11, s21, s12, s22, x1, x2, n;
{
  fork 5,5,5,5,5 thread5();
  fork 6,6,6,6,6,6 thread6();
  join 5,5,5,5,5;
  join 6,6,6,6,6,6;
  assume ( i2 == n );
  x2 := ( s12 + s22 );
}

procedure ULTIMATE.start() returns ()
modifies x, i1, i2, t11, t21, t12, t22, s11, s21, s12, s22, x1, x2, n;
{
  assume ( s11 == s21 && s11 == s12 && s11 == s22 && s11 == i1 && s11 == i2 && s11 == 0 );
  fork 1 thread1();
  fork 4,4,4,4 thread4();
  join 1;
  join 4,4,4,4;
  assume !( x1 == x2 );
  assert false; // should be unreachable
}
