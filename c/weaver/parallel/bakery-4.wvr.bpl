//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/bakery-4.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var e1 : bool;
var e2 : bool;
var e3 : bool;
var e4 : bool;
var n1 : int;
var n2 : int;
var n3 : int;
var n4 : int;
var i : int;
var i1 : int;
var i2 : int;
var i3 : int;
var i4 : int;


procedure thread1() returns ()
modifies e1, e2, e3, e4, n1, n2, n3, n4, i, i1, i2, i3, i4;
{
  e1 := true;
  n1 := ( if ( n1 < n2 ) then n2 else n1 );
  n1 := ( if ( n1 < n3 ) then n3 else n1 );
  n1 := ( if ( n1 < n4 ) then n4 else n1 );
  n1 := ( n1 + 1 );
  e1 := false;
  assume !e2;
  assume !( ( n2 != 0 ) && ( ( n2 < n1 ) || ( ( n2 == n1 ) && ( 2 < 1 ) ) ) );
  assume !e3;
  assume !( ( n3 != 0 ) && ( ( n3 < n1 ) || ( ( n3 == n1 ) && ( 3 < 1 ) ) ) );
  assume !e4;
  assume !( ( n4 != 0 ) && ( ( n4 < n1 ) || ( ( n4 == n1 ) && ( 4 < 1 ) ) ) );
  i1 := i;
  i := ( i1 + 1 );
  n1 := 0;
}

procedure thread2() returns ()
modifies e1, e2, e3, e4, n1, n2, n3, n4, i, i1, i2, i3, i4;
{
  e2 := true;
  n2 := ( if ( n2 < n1 ) then n1 else n2 );
  n2 := ( if ( n2 < n3 ) then n3 else n2 );
  n2 := ( if ( n2 < n4 ) then n4 else n2 );
  n2 := ( n2 + 1 );
  e2 := false;
  assume !e1;
  assume !( ( n1 != 0 ) && ( ( n1 < n2 ) || ( ( n1 == n2 ) && ( 1 < 2 ) ) ) );
  assume !e3;
  assume !( ( n3 != 0 ) && ( ( n3 < n2 ) || ( ( n3 == n2 ) && ( 3 < 2 ) ) ) );
  assume !e4;
  assume !( ( n4 != 0 ) && ( ( n4 < n2 ) || ( ( n4 == n2 ) && ( 4 < 2 ) ) ) );
  i2 := i;
  i := ( i2 + 1 );
  n2 := 0;
}

procedure thread3() returns ()
modifies e1, e2, e3, e4, n1, n2, n3, n4, i, i1, i2, i3, i4;
{
  e3 := true;
  n3 := ( if ( n3 < n1 ) then n1 else n3 );
  n3 := ( if ( n3 < n2 ) then n2 else n3 );
  n3 := ( if ( n3 < n4 ) then n4 else n3 );
  n3 := ( n3 + 1 );
  e3 := false;
  assume !e1;
  assume !( ( n1 != 0 ) && ( ( n1 < n3 ) || ( ( n1 == n3 ) && ( 1 < 3 ) ) ) );
  assume !e2;
  assume !( ( n2 != 0 ) && ( ( n2 < n3 ) || ( ( n2 == n3 ) && ( 2 < 3 ) ) ) );
  assume !e4;
  assume !( ( n4 != 0 ) && ( ( n4 < n3 ) || ( ( n4 == n3 ) && ( 4 < 3 ) ) ) );
  i3 := i;
  i := ( i3 + 1 );
  n3 := 0;
}

procedure thread4() returns ()
modifies e1, e2, e3, e4, n1, n2, n3, n4, i, i1, i2, i3, i4;
{
  e4 := true;
  n4 := ( if ( n4 < n1 ) then n1 else n4 );
  n4 := ( if ( n4 < n2 ) then n2 else n4 );
  n4 := ( if ( n4 < n3 ) then n3 else n4 );
  n4 := ( n4 + 1 );
  e4 := false;
  assume !e1;
  assume !( ( n1 != 0 ) && ( ( n1 < n4 ) || ( ( n1 == n4 ) && ( 1 < 4 ) ) ) );
  assume !e2;
  assume !( ( n2 != 0 ) && ( ( n2 < n4 ) || ( ( n2 == n4 ) && ( 2 < 4 ) ) ) );
  assume !e3;
  assume !( ( n3 != 0 ) && ( ( n3 < n4 ) || ( ( n3 == n4 ) && ( 3 < 4 ) ) ) );
  i4 := i;
  i := ( i4 + 1 );
  n4 := 0;
}

procedure ULTIMATE.start() returns ()
modifies e1, e2, e3, e4, n1, n2, n3, n4, i, i1, i2, i3, i4;
{
  assume ( ( i == 0 ) && ( e1 == false ) && ( e2 == false ) && ( e3 == false ) && ( e4 == false ) && ( n1 == 0 ) && ( n2 == 0 ) && ( n3 == 0 ) && ( n4 == 0 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  fork 4,4,4,4 thread4();
  join 1;
  join 2,2;
  join 3,3,3;
  join 4,4,4,4;
  assume !( i == 4 );
  assert false; // should be unreachable
}
