#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int  __VERIFIER_nondet_int(void);
extern _Bool __VERIFIER_nondet_bool(void);
extern void __VERIFIER_atomic_begin(void);
extern void __VERIFIER_atomic_end(void);

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int* A;
int min, max, N;
_Bool v_assert, b1, b2;

int *create_fresh_int_array(int size);

void* thread1() {
  min = A[0];
  b1 = 1;
  for (int i=0; i<N; i++) {
    min = min < A[i] ? min : A[i];
  }
}

void* thread2() {
  max = A[0];
  b2 = 1;
  for (int i=0; i<N; i++) {
    max = max > A[i] ? min : A[i];
  }
}

void* thread3() {
  for (int i=0; i<N; i++) {
    __VERIFIER_atomic_begin();
    A[i]--;
    __VERIFIER_atomic_end();
  }
}

void* thread4() {
  v_assert = !b1 || !b2 || min <= max + 1;
}

void main() {
  pthread_t t1, t2, t3, t4;
  
  N = __VERIFIER_nondet_int();
  A = create_fresh_int_array(N);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  pthread_join(t4, 0);
  
  assume_abort_if_not(!v_assert);
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