//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/parallel/bluetooth.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var count : int;
var sFlag : bool;
var sEvent : bool;
var stopped : bool;
var pos : int;
var v_assert : bool;


procedure thread1() returns ()
modifies count, sFlag, sEvent, stopped, pos, v_assert;
{
  atomic {
    count := ( if sFlag then count else ( count + 1 ) );
    v_assert := ( sFlag || !stopped );
  }
  count := ( count - 1 );
  if (( count == 0 )) {
    sEvent := true;

  }
}

procedure thread2() returns ()
modifies count, sFlag, sEvent, stopped, pos, v_assert;
{
  sFlag := true;
  count := ( count - 1 );
  if (( count == 0 )) {
    sEvent := true;

  }
  assume sEvent;
  stopped := true;
}

procedure ULTIMATE.start() returns ()
modifies count, sFlag, sEvent, stopped, pos, v_assert;
{
  assume ( pos == 0 );
  assume ( count == 1 );
  assume ( sFlag == false );
  assume ( sEvent == false );
  assume ( stopped == false );
  assume ( v_assert == true );
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !v_assert;
  assert false; // should be unreachable
}
