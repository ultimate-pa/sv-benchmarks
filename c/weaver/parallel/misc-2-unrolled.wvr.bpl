//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/misc-2-unrolled.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var pos : int;
var i1 : int;
var i2 : int;
var N : int;


procedure thread1() returns ()
modifies pos, i1, i2, N;
{
  while (( i1 < ( 2 * N ) )) {
    pos := ( pos + 1 );
    i1 := ( i1 + 1 );
    pos := ( pos - 1 );
    i1 := ( i1 + 1 );
  }
}

procedure thread2() returns ()
modifies pos, i1, i2, N;
{
  while (( i2 < ( 2 * N ) )) {
    pos := ( pos + 2 );
    i2 := ( i2 + 1 );
    pos := ( pos - 2 );
    i2 := ( i2 + 1 );
  }
}

procedure ULTIMATE.start() returns ()
modifies pos, i1, i2, N;
{
  assume ( pos == i1 && pos == i2 && pos == 0 );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( pos == 0 );
  assert false; // should be unreachable
}
