//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/prod-cons-eq.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var produce : [int] int;
var update : [int] int;
var done : [int] bool;
var consume : [int, int] int;
var queue1 : [int] int;
var front1 : int;
var size1 : int;
var state11 : int;
var state12 : int;
var finished1 : bool;
var state21 : int;
var state22 : int;
var finished2 : bool;


procedure thread1() returns ()
modifies produce, update, done, consume, queue1, front1, size1, state11, state12, finished1, state21, state22, finished2;
{
  while (!finished1) {
    atomic {
      assume ( queue1[( front1 + size1 )] == produce[state11] );
      size1 := ( size1 + 1 );
    }
    state11 := update[state11];
    finished1 := done[state11];
  }
}

procedure thread2() returns ()
modifies produce, update, done, consume, queue1, front1, size1, state11, state12, finished1, state21, state22, finished2;
{
  while (( !finished1 || ( size1 > 0 ) )) {
    atomic {
      assume ( size1 > 0 );
      state12 := consume[state12, queue1[front1]];
      front1 := ( front1 + 1 );
      size1 := ( size1 - 1 );
    }
  }
}

procedure thread3() returns ()
modifies produce, update, done, consume, queue1, front1, size1, state11, state12, finished1, state21, state22, finished2;
{
  while (!finished2) {
    state22 := consume[state22, produce[state21]];
    state21 := update[state21];
    finished2 := done[state21];
  }
}

procedure ULTIMATE.start() returns ()
modifies produce, update, done, consume, queue1, front1, size1, state11, state12, finished1, state21, state22, finished2;
{
  assume ( ( state11 == state21 ) && ( state12 == state22 ) && ( finished1 == finished2 && finished1 == false ) && ( size1 == 0 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( state12 == state22 );
  assert false; // should be unreachable
}
