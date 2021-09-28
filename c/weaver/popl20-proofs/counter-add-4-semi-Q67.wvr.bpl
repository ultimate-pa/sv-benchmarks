//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-proofs/counter-add-4-semi-Q67.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var i1 : int;
var i2 : int;
var N1 : int;
var N2 : int;
var counter : int;
var j1 : int;
var j2 : int;
var M1 : int;
var M2 : int;


procedure thread1() returns ()
modifies i1, i2, N1, N2, counter, j1, j2, M1, M2;
{
  while (( i1 < N1 )) {
    atomic {
      counter := ( counter + 1 );
      i1 := ( i1 + 1 );
    }
  }
}

procedure thread2() returns ()
modifies i1, i2, N1, N2, counter, j1, j2, M1, M2;
{
  while (( i2 < N2 )) {
    atomic {
      assume ( 0 < counter );
      counter := ( counter - 1 );
      i2 := ( i2 + 1 );
    }
  }
}

procedure thread3() returns ()
modifies i1, i2, N1, N2, counter, j1, j2, M1, M2;
{
  while (( j1 < M1 )) {
    atomic {
      counter := ( counter + 1 );
      j1 := ( j1 + 1 );
    }
  }
}

procedure thread4() returns ()
modifies i1, i2, N1, N2, counter, j1, j2, M1, M2;
{
  while (( j2 < M2 )) {
    atomic {
      assume ( 0 < counter );
      counter := ( counter - 1 );
      j2 := ( j2 + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies i1, i2, N1, N2, counter, j1, j2, M1, M2;
{
  assume ( i1 == i2 && i1 == j1 && i1 == j2 && i1 == 0 );
  assume ( counter == 0 );
  assume ( N1 == N2 && N1 == M1 && N1 == M2 );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  fork 4,4,4,4 thread4();
  join 1;
  join 2,2;
  join 3,3,3;
  join 4,4,4,4;
  assume !( counter == 0 );
  assert false; // should be unreachable
}
