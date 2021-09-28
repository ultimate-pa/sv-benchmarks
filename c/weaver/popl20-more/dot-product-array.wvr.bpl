//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-more/dot-product-array.wvr'.
*
* Generated: 2021-02-25T09:33:24.
*/
var res1 : int;
var res2 : int;
var i : int;
var j : int;
var k : int;
var N : int;
var M : int;
var A : [int] int;
var B : [int] int;
var mult : [int, int] int;


procedure thread1() returns ()
modifies res1, res2, i, j, k, N, M, A, B, mult;
{
  while (( i < N )) {
    atomic {
      res1 := ( res1 + mult[A[ i ], B[ i ]] );
      i := ( i + 1 );
    }
  }
}

procedure thread2() returns ()
modifies res1, res2, i, j, k, N, M, A, B, mult;
{
  while (( j < M )) {
    atomic {
      res2 := ( res2 + mult[A[ j ], B[ j ]] );
      j := ( j + 1 );
    }
  }
}

procedure thread3() returns ()
modifies res1, res2, i, j, k, N, M, A, B, mult;
{
  while (( k < N )) {
    atomic {
      res2 := ( res2 + mult[A[ k ], B[ k ]] );
      k := ( k + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies res1, res2, i, j, k, N, M, A, B, mult;
{
  assume ( 0 <= M );
  assume ( M < N );
  assume ( i == j && i == res1 && i == res2 && i == 0 );
  assume ( k == M );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( res1 == res2 );
  assert false; // should be unreachable
}
