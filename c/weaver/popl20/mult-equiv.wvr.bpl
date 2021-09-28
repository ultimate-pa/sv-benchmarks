//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/mult-equiv.wvr'.
*
* Generated: 2021-02-25T09:33:25.
*/
var L : int;
var N : int;
var M : int;
var p : int;
var q : int;


procedure thread1() returns ()
modifies L, N, M, p, q;
{
  while (( 0 < N )) {
    atomic {
      p := ( if ( N > 0 ) then ( p + M ) else p );
      N := ( if ( N > 0 ) then ( N - 1 ) else N );
    }
  }
}

procedure thread2() returns ()
modifies L, N, M, p, q;
{
  while (( 1 < N )) {
    atomic {
      p := ( if ( N > 1 ) then ( p + ( M + M ) ) else p );
      N := ( if ( N > 1 ) then ( N - 2 ) else N );
    }
  }
}

procedure thread3() returns ()
modifies L, N, M, p, q;
{
  while (( 0 < L )) {
    atomic {
      q := ( q + M );
      L := ( L + ( - 1 ) );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies L, N, M, p, q;
{
  assume ( ( p == q && p == 0 ) && ( L == N ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( p == q );
  assert false; // should be unreachable
}
