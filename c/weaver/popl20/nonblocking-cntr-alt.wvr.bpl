//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/nonblocking-cntr-alt.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var j1 : int;
var j2 : int;
var M1 : int;
var M2 : int;
var counter : int;


procedure thread1() returns ()
modifies j1, j2, M1, M2, counter;
{
  while (( j1 < M1 )) {
    atomic {
      counter := ( counter + 1 );
      j1 := ( j1 + 1 );
    }
  }
}

procedure thread2() returns ()
modifies j1, j2, M1, M2, counter;
{
  while (( j2 < M2 )) {
    atomic {
      j2 := ( if ( 0 < counter ) then ( j2 + 1 ) else j2 );
      counter := ( if ( 0 < counter ) then ( counter - 1 ) else counter );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies j1, j2, M1, M2, counter;
{
  assume ( j1 == 0 );
  assume ( j2 == 0 );
  assume ( counter == 0 );
  assume ( 0 < M1 );
  assume ( 0 < M2 );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( counter == ( M1 - M2 ) );
  assert false; // should be unreachable
}
