//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/misc-2.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var pos : int;
var i1 : int;
var i2 : int;
var N : int;
var d1 : bool;
var d2 : bool;


procedure thread1() returns ()
modifies pos, i1, i2, N, d1, d2;
{
  while (( i1 < ( 2 * N ) )) {
    if (d1) {
      pos := ( pos + 1 );

    }
    else {
      pos := ( pos - 1 );

    }
    d1 := !d1;
    i1 := ( i1 + 1 );
  }
}

procedure thread2() returns ()
modifies pos, i1, i2, N, d1, d2;
{
  while (( i2 < ( 2 * N ) )) {
    if (d2) {
      pos := ( pos + 2 );

    }
    else {
      pos := ( pos - 2 );

    }
    d2 := !d2;
    i2 := ( i2 + 1 );
  }
}

procedure ULTIMATE.start() returns ()
modifies pos, i1, i2, N, d1, d2;
{
  assume ( pos == i1 && pos == i2 && pos == 0 );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( pos == 0 );
  assert false; // should be unreachable
}
