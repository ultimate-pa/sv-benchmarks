//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/prod-cons.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var queue : [int] int;
var front : int;
var back : int;
var d : int;
var w : int;
var W : int;
var temp : int;
var v_assert : bool;


procedure thread1() returns ()
modifies queue, front, back, d, w, W, temp, v_assert;
{
  while (( v_assert && ( 0 < w ) )) {
    atomic {
      assume ( queue[back] == 1 );
      back := ( back + 1 );
    }
    w := ( w - 1 );
  }
}

procedure thread2() returns ()
modifies queue, front, back, d, w, W, temp, v_assert;
{
  while (v_assert) {
    atomic {
      assume ( front < back );
      temp := queue[front];
      front := ( front + 1 );
    }
    d := ( d + temp );
  }
}

procedure thread3() returns ()
modifies queue, front, back, d, w, W, temp, v_assert;
{
  v_assert := ( d <= W );
}

procedure ULTIMATE.start() returns ()
modifies queue, front, back, d, w, W, temp, v_assert;
{
  assume ( W >= 0 );
  assume ( w == W );
  assume ( d == 0 );
  assume v_assert;
  assume ( front == back );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !v_assert;
  assert false; // should be unreachable
}
