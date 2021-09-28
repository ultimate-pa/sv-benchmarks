//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-more/nonblocking-counter-alt2.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var j1 : int;
var j2 : int;
var M1 : int;
var M2 : int;
var C : int;
var counter : int;


procedure thread1() returns ()
modifies j1, j2, M1, M2, C, counter;
{
  while (( j1 < M1 )) {
    atomic {
      counter := ( counter + C );
      j1 := ( j1 + 1 );
    }
  }
}

procedure thread2() returns ()
modifies j1, j2, M1, M2, C, counter;
{
  while (( j2 < M2 )) {
    atomic {
      j2 := ( if ( 0 < counter ) then ( j2 + 1 ) else j2 );
      counter := ( if ( 0 < counter ) then ( counter - C ) else counter );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies j1, j2, M1, M2, C, counter;
{
  assume ( j1 == 0 );
  assume ( j2 == 0 );
  assume ( counter == 0 );
  assume ( M2 == M1 );
  assume ( 0 < M2 );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( counter == 0 );
  assert false; // should be unreachable
}
