//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/simple-queue.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var queue : [int] int;
var front : int;
var back : int;
var x : int;


procedure thread1() returns ()
modifies queue, front, back, x;
{
  while (*) {
    atomic {
      assume ( queue[back] == 5 );
      back := ( back + 1 );
    }
  }
}

procedure thread2() returns ()
modifies queue, front, back, x;
{
  while (*) {
    atomic {
      assume ( back > front );
      x := queue[front];
      front := ( front + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies queue, front, back, x;
{
  assume ( ( front == back ) && ( x == 5 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( x == 5 );
  assert false; // should be unreachable
}
