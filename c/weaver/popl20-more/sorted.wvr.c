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

int* A;
int M, N;
_Bool sorted1, sorted2, sorted3;

int *create_fresh_int_array(int size);

void* thread1() {
  for (int i=0; i<N-1; i++) {
    sorted1 = sorted1 && A[i] < A[i+1];
  }
}

void* thread2() {
  for (int i=0; i<M; i++) {
    sorted2 = sorted2 && A[i] < A[i+1];
  }
}

void* thread3() {
  for (int i=M; i<N-1; i++) {
    sorted3 = sorted3 && A[i] < A[i+1];
  }
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  M = __VERIFIER_nondet_int();
  N = __VERIFIER_nondet_int();
  A = create_fresh_int_array(N);
  sorted1 = 1;
  sorted2 = 1;
  sorted3 = 1;
  
  assume_abort_if_not(M >= 0 && M < N);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
  assume_abort_if_not(sorted1 != (sorted2 && sorted3));
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