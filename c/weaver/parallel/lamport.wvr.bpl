//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/lamport.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var e1 : bool;
var e2 : bool;
var n1 : int;
var n2 : int;
var tmp1 : int;
var tmp2 : int;
var f : [int] int;
var i : int;
var j : int;
var i1 : int;
var i2 : int;


procedure thread1() returns ()
modifies e1, e2, n1, n2, tmp1, tmp2, f, i, j, i1, i2;
{
  e1 := true;
  tmp1 := n2;
  n1 := ( tmp1 + 1 );
  e1 := false;
  assume !e2;
  assume ( ( n2 == 0 ) || ( n2 >= n1 ) );
  i1 := i;
  i := f[i1];
  n1 := 0;
}

procedure thread2() returns ()
modifies e1, e2, n1, n2, tmp1, tmp2, f, i, j, i1, i2;
{
  e2 := true;
  tmp2 := n1;
  n2 := ( tmp2 + 1 );
  e2 := false;
  assume !e1;
  assume ( ( n1 == 0 ) || ( n1 > n2 ) );
  i2 := i;
  i := f[i2];
  n2 := 0;
}

procedure thread3() returns ()
modifies e1, e2, n1, n2, tmp1, tmp2, f, i, j, i1, i2;
{
  j := f[j];
  j := f[j];
}

procedure ULTIMATE.start() returns ()
modifies e1, e2, n1, n2, tmp1, tmp2, f, i, j, i1, i2;
{
  assume ( i == j );
  e1 := false;
  e2 := false;
  n1 := 0;
  n2 := 0;
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( i == j );
  assert false; // should be unreachable
}
