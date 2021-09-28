//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/misc-3.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var pos : int;
var d1 : bool;
var d2 : bool;
var g1 : bool;
var g2 : bool;


procedure thread1() returns ()
modifies pos, d1, d2, g1, g2;
{
  while (g1) {
    if (d1) {
      pos := ( pos + 1 );

    }
    else {
      pos := ( pos - 1 );

    }
    d1 := !d1;
    if (d1) {
      if (*) {
        g1 := false;
      }
      else {
      }

    }
  }
}

procedure thread2() returns ()
modifies pos, d1, d2, g1, g2;
{
  while (g2) {
    if (d2) {
      pos := ( pos + 2 );

    }
    else {
      pos := ( pos - 2 );

    }
    d2 := !d2;
    if (d2) {
      if (*) {
        g2 := false;
      }
      else {
      }

    }
  }
}

procedure ULTIMATE.start() returns ()
modifies pos, d1, d2, g1, g2;
{
  assume ( ( pos == 0 ) && ( d1 == d2 && d1 == g1 && d1 == g2 && d1 == true ) );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( pos == 0 );
  assert false; // should be unreachable
}
