//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-more/multiply-verify.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var A : int;
var B : int;
var i1 : int;
var i2 : int;
var x1 : int;
var x2 : int;
var queue : [int] int;
var start : int;
var end : int;
var ok : bool;


procedure thread1() returns ()
modifies A, B, i1, i2, x1, x2, queue, start, end, ok;
{
  x1 := 0;
  i1 := 0;
  while (( i1 < A )) {
    x1 := ( x1 + B );
    i1 := ( i1 + 1 );
  }
  atomic {
    assume ( queue[end] == x1 );
    end := ( end + 1 );
  }
}

procedure thread2() returns ()
modifies A, B, i1, i2, x1, x2, queue, start, end, ok;
{
  x2 := 0;
  i2 := 0;
  while (( i2 < A )) {
    x2 := ( x2 + B );
    i2 := ( i2 + 1 );
  }
  atomic {
    assume ( queue[end] == x2 );
    end := ( end + 1 );
  }
}

procedure thread3() returns ()
modifies A, B, i1, i2, x1, x2, queue, start, end, ok;
{
  assume ( end == ( start + 2 ) );
  ok := ( queue[start] == queue[( start + 1 )] );
}

procedure ULTIMATE.start() returns ()
modifies A, B, i1, i2, x1, x2, queue, start, end, ok;
{
  assume ( start == end );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !ok;
  assert false; // should be unreachable
}
