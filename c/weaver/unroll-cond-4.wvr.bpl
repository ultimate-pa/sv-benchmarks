//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/unroll-cond-4.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var f : [int] int;
var i1 : int;
var x1 : int;
var i2 : int;
var x2 : int;
var n : int;


procedure thread1() returns ()
modifies f, i1, x1, i2, x2, n;
{
  while (*) {
    atomic {
      assume ( i1 < n );
      x1 := f[x1];
      i1 := ( i1 + 1 );
    }
  }
  assume !( i1 < n );
}

procedure thread2() returns ()
modifies f, i1, x1, i2, x2, n;
{
  while (*) {
    atomic {
      assume ( i2 < ( n - 3 ) );
      x2 := f[x2];
      i2 := ( i2 + 1 );
      x2 := f[x2];
      i2 := ( i2 + 1 );
      x2 := f[x2];
      i2 := ( i2 + 1 );
      x2 := f[x2];
      i2 := ( i2 + 1 );
    }
  }
  atomic {
    assume !( i2 < ( n - 3 ) );
    x2 := ( if ( i2 < ( n - 2 ) ) then f[x2] else x2 );
    i2 := ( if ( i2 < ( n - 2 ) ) then ( i2 + 1 ) else i2 );
    x2 := ( if ( i2 < ( n - 1 ) ) then f[x2] else x2 );
    i2 := ( if ( i2 < ( n - 1 ) ) then ( i2 + 1 ) else i2 );
    x2 := ( if ( i2 < n ) then f[x2] else x2 );
    i2 := ( if ( i2 < n ) then ( i2 + 1 ) else i2 );
  }
}

procedure ULTIMATE.start() returns ()
modifies f, i1, x1, i2, x2, n;
{
  assume ( i1 == i2 && i1 == x1 && i1 == x2 && i1 == 0 );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( x1 == x2 );
  assert false; // should be unreachable
}
