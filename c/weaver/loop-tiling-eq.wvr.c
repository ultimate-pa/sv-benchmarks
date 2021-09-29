#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int  __VERIFIER_nondet_int(void);
extern void __VERIFIER_atomic_begin(void);
extern void __VERIFIER_atomic_end(void);

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int** B;
int*  A;
int*  F;
int L, N, M, a, b;

int *create_fresh_int_array(int size);

void* thread1() {
  for (int i=0; i<L; i++) {
    A[i] = F[i];
  }
}

void* thread2() {
  for (int i=0; i<N; i++) {
    for (int j=0; j<M; j++) {
	  B[i][j] = F[i*M+j];
    }
  }
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  M = __VERIFIER_nondet_int();
  N = __VERIFIER_nondet_int();
  L = M * N;
  A = create_fresh_int_array(L);
  F = create_fresh_int_array(L);
  B = (int**)malloc(sizeof(int) * L);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  
  a = __VERIFIER_nondet_int();
  b = __VERIFIER_nondet_int();
  assume_abort_if_not(a >= 0 && a < N && b >= 0 && b < M);
  assume_abort_if_not(A[a*M+b] != B[a][b]);
  reach_error();
}

int *create_fresh_int_array(int size) {
  assume_abort_if_not(size >= 0);

  int* arr = (int*)malloc(sizeof(int) * size);
  for (int i = 0; i < size; i++) {
    arr[i] = __VERIFIER_nondet_int();
  }
  return arr;
}