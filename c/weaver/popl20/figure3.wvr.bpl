//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/figure3.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var i1 : int;
var i2 : int;
var N1 : int;
var N2 : int;
var counter : int;
var C : int;


procedure thread1() returns ()
modifies i1, i2, N1, N2, counter, C;
{
  while (( i1 < N1 )) {
    atomic {
      counter := ( counter + C );
      i1 := ( i1 + 1 );
    }
  }
}

procedure thread2() returns ()
modifies i1, i2, N1, N2, counter, C;
{
  while (( i2 < N2 )) {
    atomic {
      assume ( 0 < counter );
      counter := ( counter - C );
      i2 := ( i2 + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies i1, i2, N1, N2, counter, C;
{
  assume ( i1 == 0 );
  assume ( counter == 0 );
  assume ( i2 == 0 );
  assume ( N1 == N2 );
  assume ( 0 < C );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( counter == 0 );
  assert false; // should be unreachable
}
