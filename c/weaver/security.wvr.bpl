//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/security.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var y_0 : int;
var x_1 : int;
var z_2 : int;
var h_3 : bool;
var l_4 : int;
var x_5 : int;
var z_6 : int;
var h_7 : bool;
var l_8 : int;


procedure thread1() returns ()
modifies y_0, x_1, z_2, h_3, l_4, x_5, z_6, h_7, l_8;
{
  z_2 := 1;
  if (*) {
    assume h_3;
    x_1 := 1;
  }
  else {
    assume !h_3;
  }
  if (*) {
    assume !h_3;
    x_1 := z_2;
  }
  else {
    assume !!h_3;
  }
  l_4 := ( x_1 + y_0 );
}

procedure thread2() returns ()
modifies y_0, x_1, z_2, h_3, l_4, x_5, z_6, h_7, l_8;
{
  z_6 := 1;
  if (*) {
    assume h_7;
    x_5 := 1;
  }
  else {
    assume !h_7;
  }
  if (*) {
    assume !h_7;
    x_5 := z_6;
  }
  else {
    assume !!h_7;
  }
  l_8 := ( x_5 + y_0 );
}

procedure ULTIMATE.start() returns ()
modifies y_0, x_1, z_2, h_3, l_4, x_5, z_6, h_7, l_8;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( l_4 == l_8 );
  assert false; // should be unreachable
}
