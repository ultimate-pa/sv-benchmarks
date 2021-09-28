//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/channel-sum.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var queue : [int] int;
var front : int;
var back : int;
var element : int;
var sum : int;
var flag : bool;


procedure thread1() returns ()
modifies queue, front, back, element, sum, flag;
{
  while (*) {
    atomic {
      assume ( back > front );
      element := queue[front];
      front := ( front + 1 );
    }
    sum := ( sum + element );
  }
}

procedure thread2() returns ()
modifies queue, front, back, element, sum, flag;
{
  while (*) {
    if (flag) {
      atomic {
        assume ( queue[back] == 1 );
        back := ( back + 1 );
      }

    }
    else {
      atomic {
        assume ( queue[back] == ( - 1 ) );
        back := ( back + 1 );
      }

    }
    flag := !flag;
  }
}

procedure ULTIMATE.start() returns ()
modifies queue, front, back, element, sum, flag;
{
  assume ( front == back );
  assume ( sum == 0 );
  assume flag;
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( 0 <= sum ) && ( sum <= 1 ) );
  assert false; // should be unreachable
}
