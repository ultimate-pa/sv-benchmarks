//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/send-receive.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var queue : [int] int;
var front : int;
var back : int;
var sum : int;
var v_assert : bool;
var b : bool;


procedure thread1() returns ()
modifies queue, front, back, sum, v_assert, b;
{
  while (v_assert) {
    atomic {
      assume ( back > front );
      sum := ( sum + queue[front] );
      front := ( front + 1 );
    }
  }
}

procedure thread2() returns ()
modifies queue, front, back, sum, v_assert, b;
{
  while (v_assert) {
    if (b) {
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
    b := !b;
  }
}

procedure thread3() returns ()
modifies queue, front, back, sum, v_assert, b;
{
  v_assert := ( ( 0 <= sum ) && ( sum <= 1 ) );
}

procedure ULTIMATE.start() returns ()
modifies queue, front, back, sum, v_assert, b;
{
  assume ( front == back );
  assume ( sum == 0 );
  assume v_assert;
  assume b;
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assert false; // should be unreachable
}
