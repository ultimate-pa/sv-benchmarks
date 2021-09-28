//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/misc-4.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var pos : int;
var d1 : bool;
var d2 : bool;
var v_assert : bool;


procedure thread1() returns ()
modifies pos, d1, d2, v_assert;
{
  while (v_assert) {
    if (d1) {
      pos := ( pos + 1 );

    }
    else {
      pos := ( pos - 1 );

    }
    d1 := !d1;
  }
}

procedure thread2() returns ()
modifies pos, d1, d2, v_assert;
{
  while (v_assert) {
    if (d2) {
      pos := ( pos + 2 );

    }
    else {
      pos := ( pos - 2 );

    }
    d2 := !d2;
  }
}

procedure thread3() returns ()
modifies pos, d1, d2, v_assert;
{
  v_assert := ( pos >= 0 );
}

procedure ULTIMATE.start() returns ()
modifies pos, d1, d2, v_assert;
{
  assume ( ( pos == 0 ) && ( d1 == d2 && d1 == true ) && ( v_assert == true ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assert false; // should be unreachable
}
