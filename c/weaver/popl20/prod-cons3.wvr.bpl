//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/prod-cons3.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var queue1 : [int] int;
var front1 : int;
var back1 : int;
var queue2 : [int] int;
var front2 : int;
var back2 : int;
var d1 : int;
var d2 : int;
var w : int;
var W : int;
var temp1 : int;
var temp2 : int;
var v_assert : bool;


procedure thread1() returns ()
modifies queue1, front1, back1, queue2, front2, back2, d1, d2, w, W, temp1, temp2, v_assert;
{
  while (( v_assert && ( 0 < w ) )) {
    atomic {
      assume ( queue1[back1] == 1 );
      back1 := ( back1 + 1 );
    }
    w := ( w - 1 );
  }
}

procedure thread2() returns ()
modifies queue1, front1, back1, queue2, front2, back2, d1, d2, w, W, temp1, temp2, v_assert;
{
  while (v_assert) {
    atomic {
      assume ( front1 < back1 );
      temp1 := queue1[front1];
      front1 := ( front1 + 1 );
    }
    atomic {
      assume ( queue2[back2] == ( temp1 + 1 ) );
      back2 := ( back2 + 1 );
    }
    d1 := ( d1 + temp1 );
  }
}

procedure thread3() returns ()
modifies queue1, front1, back1, queue2, front2, back2, d1, d2, w, W, temp1, temp2, v_assert;
{
  while (v_assert) {
    atomic {
      assume ( front2 < back2 );
      temp2 := queue2[front2];
      front2 := ( front2 + 1 );
    }
    d2 := ( d2 + temp2 );
  }
}

procedure thread4() returns ()
modifies queue1, front1, back1, queue2, front2, back2, d1, d2, w, W, temp1, temp2, v_assert;
{
  v_assert := ( d2 <= ( 2 * W ) );
}

procedure ULTIMATE.start() returns ()
modifies queue1, front1, back1, queue2, front2, back2, d1, d2, w, W, temp1, temp2, v_assert;
{
  assume ( W >= 0 );
  assume ( w == W );
  assume ( d1 == d2 && d1 == 0 );
  assume v_assert;
  assume ( front1 == back1 );
  assume ( front2 == back2 );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  fork 4,4,4,4 thread4();
  join 1;
  join 2,2;
  join 3,3,3;
  join 4,4,4,4;
  assume !v_assert;
  assert false; // should be unreachable
}
