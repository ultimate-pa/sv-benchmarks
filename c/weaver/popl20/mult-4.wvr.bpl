//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/mult-4.wvr'.
*
* Generated: 2021-02-25T09:33:25.
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
var C : int;


procedure thread1() returns ()
modifies i1, i2, N1, N2, counter, j1, j2, M1, M2, C;
{
  while (( i1 < N1 )) {
    atomic {
      counter := ( counter + C );
      i1 := ( i1 + 1 );
    }
  }
}

procedure thread2() returns ()
modifies i1, i2, N1, N2, counter, j1, j2, M1, M2, C;
{
  while (( i2 < N2 )) {
    atomic {
      assume ( 0 < counter );
      counter := ( counter - C );
      i2 := ( i2 + 1 );
    }
  }
}

procedure thread3() returns ()
modifies i1, i2, N1, N2, counter, j1, j2, M1, M2, C;
{
  while (( j1 < M1 )) {
    atomic {
      counter := ( counter + C );
      j1 := ( j1 + 1 );
    }
  }
}

procedure thread4() returns ()
modifies i1, i2, N1, N2, counter, j1, j2, M1, M2, C;
{
  while (( j2 < M2 )) {
    atomic {
      assume ( 0 < counter );
      counter := ( counter - C );
      j2 := ( j2 + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies i1, i2, N1, N2, counter, j1, j2, M1, M2, C;
{
  assume ( i1 == i2 && i1 == j1 && i1 == j2 && i1 == 0 );
  assume ( counter == 0 );
  assume ( N1 == N2 && N1 == M1 && N1 == M2 );
  assume ( 0 < C );
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
