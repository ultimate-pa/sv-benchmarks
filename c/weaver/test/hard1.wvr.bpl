//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/test/hard1.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var p1 : int;
var p2 : int;
var n1 : int;
var n2 : int;
var m : int;


procedure thread1() returns ()
modifies p1, p2, n1, n2, m;
{
  while (( n1 > 0 )) {
    atomic {
      p1 := ( if ( n1 > 0 ) then ( p1 + m ) else p1 );
      n1 := ( if ( n1 > 0 ) then ( n1 - 1 ) else n1 );
    }
  }
}

procedure thread2() returns ()
modifies p1, p2, n1, n2, m;
{
  while (( n1 > 1 )) {
    atomic {
      p1 := ( if ( n1 > 1 ) then ( p1 + ( 2 * m ) ) else p1 );
      n1 := ( if ( n1 > 1 ) then ( n1 - 2 ) else n1 );
    }
  }
}

procedure thread3() returns ()
modifies p1, p2, n1, n2, m;
{
  while (( n2 > 0 )) {
    atomic {
      p2 := ( if ( n2 > 0 ) then ( p2 + m ) else p2 );
      n2 := ( if ( n2 > 0 ) then ( n2 - 1 ) else n2 );
    }
  }
}

procedure thread4() returns ()
modifies p1, p2, n1, n2, m;
{
  while (( n2 > 1 )) {
    atomic {
      p2 := ( if ( n2 > 1 ) then ( p2 + ( 2 * m ) ) else p2 );
      n2 := ( if ( n2 > 1 ) then ( n2 - 2 ) else n2 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies p1, p2, n1, n2, m;
{
  assume ( ( p1 == p2 ) && ( n1 == n2 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  fork 4,4,4,4 thread4();
  join 1;
  join 2,2;
  join 3,3,3;
  join 4,4,4,4;
  assume !( p1 == p2 );
  assert false; // should be unreachable
}
