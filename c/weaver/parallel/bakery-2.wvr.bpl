//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/bakery-2.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var e1 : bool;
var e2 : bool;
var n1 : int;
var n2 : int;
var i : int;
var i1 : int;
var i2 : int;


procedure thread1() returns ()
modifies e1, e2, n1, n2, i, i1, i2;
{
  e1 := true;
  n1 := ( if ( n1 < n2 ) then n2 else n1 );
  n1 := ( n1 + 1 );
  e1 := false;
  assume !e2;
  assume !( ( n2 != 0 ) && ( ( n2 < n1 ) || ( ( n2 == n1 ) && ( 2 < 1 ) ) ) );
  i1 := i;
  i := ( i1 + 1 );
  n1 := 0;
}

procedure thread2() returns ()
modifies e1, e2, n1, n2, i, i1, i2;
{
  e2 := true;
  n2 := ( if ( n2 < n1 ) then n1 else n2 );
  n2 := ( n2 + 1 );
  e2 := false;
  assume !e1;
  assume !( ( n1 != 0 ) && ( ( n1 < n2 ) || ( ( n1 == n2 ) && ( 1 < 2 ) ) ) );
  i2 := i;
  i := ( i2 + 1 );
  n2 := 0;
}

procedure ULTIMATE.start() returns ()
modifies e1, e2, n1, n2, i, i1, i2;
{
  assume ( ( i == 0 ) && ( e1 == false ) && ( e2 == false ) && ( n1 == 0 ) && ( n2 == 0 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( i == 2 );
  assert false; // should be unreachable
}
