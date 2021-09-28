//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/misc-5.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var pos : int;
var c1 : int;
var c2 : int;
var v_assert : bool;


procedure thread1() returns ()
modifies pos, c1, c2, v_assert;
{
  while (v_assert) {
    if (*) {
      atomic {
        pos := ( pos + 1 );
        c1 := ( c1 + 1 );
      }
    }
    else {
      atomic {
        assume ( c1 > 0 );
        pos := ( pos - 1 );
        c1 := ( c1 - 1 );
      }
    }
  }
}

procedure thread2() returns ()
modifies pos, c1, c2, v_assert;
{
  while (v_assert) {
    if (*) {
      atomic {
        pos := ( pos + 1 );
        c2 := ( c2 + 1 );
      }
    }
    else {
      atomic {
        assume ( c2 > 0 );
        pos := ( pos - 1 );
        c2 := ( c2 - 1 );
      }
    }
  }
}

procedure thread3() returns ()
modifies pos, c1, c2, v_assert;
{
  v_assert := ( pos >= 0 );
}

procedure ULTIMATE.start() returns ()
modifies pos, c1, c2, v_assert;
{
  assume ( ( pos == c1 && pos == c2 && pos == 0 ) && ( v_assert == true ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assert false; // should be unreachable
}
