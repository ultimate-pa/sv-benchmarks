//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/counter-fun.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var f : [int] int;
var f_inv : [int] int;
var i1 : int;
var i2 : int;
var N1 : int;
var N2 : int;
var counter : int;


procedure thread1() returns ()
modifies f, f_inv, i1, i2, N1, N2, counter;
{
  while (( i1 < N1 )) {
    atomic {
      assume ( f_inv[f[counter]] == counter );
      counter := f[counter];
      i1 := ( i1 + 1 );
    }
  }
}

procedure thread2() returns ()
modifies f, f_inv, i1, i2, N1, N2, counter;
{
  while (( i2 < N2 )) {
    atomic {
      assume ( f[f_inv[counter]] == counter );
      counter := f_inv[counter];
      i2 := ( i2 + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies f, f_inv, i1, i2, N1, N2, counter;
{
  assume ( i1 == 0 );
  assume ( counter == 0 );
  assume ( i2 == 0 );
  assume ( N1 == N2 );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( counter == 0 );
  assert false; // should be unreachable
}
