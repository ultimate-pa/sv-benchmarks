//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-bad/dot-product.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var res1 : int;
var res2 : int;
var i1 : int;
var i2 : int;
var j1 : int;
var j2 : int;
var k1 : int;
var k2 : int;
var N : int;
var M : int;
var A : [int] int;
var B : [int] int;


procedure thread1() returns ()
modifies res1, res2, i1, i2, j1, j2, k1, k2, N, M, A, B;
{
  while (( i1 < N )) {
    i2 := 0;
    while (( i2 < A[i1] )) {
      res1 := ( res1 + B[i1] );
      i2 := ( i2 + 1 );
    }
    i1 := ( i1 + 1 );
  }
}

procedure thread2() returns ()
modifies res1, res2, i1, i2, j1, j2, k1, k2, N, M, A, B;
{
  while (( j1 < M )) {
    j2 := 0;
    while (( j2 < A[j1] )) {
      res2 := ( res2 + B[j1] );
      j2 := ( j2 + 1 );
    }
    j1 := ( j1 + 1 );
  }
}

procedure thread3() returns ()
modifies res1, res2, i1, i2, j1, j2, k1, k2, N, M, A, B;
{
  while (( k1 < N )) {
    k2 := 0;
    while (( k2 < A[k1] )) {
      res2 := ( res2 + B[k1] );
      k2 := ( k2 + 1 );
    }
    k1 := ( k1 + 1 );
  }
}

procedure ULTIMATE.start() returns ()
modifies res1, res2, i1, i2, j1, j2, k1, k2, N, M, A, B;
{
  assume ( 0 <= M );
  assume ( M < N );
  assume ( i1 == j1 && i1 == res1 && i1 == res2 && i1 == 0 );
  assume ( k1 == M );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( res1 == res2 );
  assert false; // should be unreachable
}
