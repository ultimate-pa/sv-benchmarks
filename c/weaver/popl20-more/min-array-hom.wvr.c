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

int*  A;
int min1, min2, min3, M, N;

int *create_fresh_int_array(int size);

void* thread1() {
  for (int i=0; i<N; i++) {
    __VERIFIER_atomic_begin();
    if (min1 > A[i]) {
      min1 = A[i];
    }
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  for (int i=0; i<M; i++) {
    __VERIFIER_atomic_begin();
    if (min2 > A[i]) {
      min2 = A[i];
    }
    __VERIFIER_atomic_end();
  }
}

void* thread3() {
  for (int i=M; i<N; i++) {
    __VERIFIER_atomic_begin();
    if (min3 > A[i]) {
      min3 = A[i];
    }
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  M = __VERIFIER_nondet_int();
  N = __VERIFIER_nondet_int();
  A = create_fresh_int_array(N);
  
  assume_abort_if_not(M >= 0 && M < N);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
  assume_abort_if_not(min1 != (min2 < min3 ? min3 : min2));
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