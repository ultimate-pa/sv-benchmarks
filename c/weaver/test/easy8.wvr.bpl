//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/test/easy8.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var b : bool;
var c : bool;


procedure thread1() returns ()
modifies b, c;
{
  atomic {
    assume !b;
    c := false;
  }
}

procedure thread2() returns ()
modifies b, c;
{
  atomic {
    b := true;
    c := true;
  }
}

procedure ULTIMATE.start() returns ()
modifies b, c;
{
  assume true;
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !c;
  assert false; // should be unreachable
}
