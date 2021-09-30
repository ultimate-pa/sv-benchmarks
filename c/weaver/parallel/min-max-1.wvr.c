#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int   __VERIFIER_nondet_int(void);
extern _Bool __VERIFIER_nondet_bool(void);
extern void  __VERIFIER_atomic_begin();
extern void  __VERIFIER_atomic_end();

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int* A;
int min, max, i, j, N;
_Bool v_assert, b1, b2;

int *create_fresh_int_array(int size);

void* thread1() {
  min = A[0];
  b1 = 1;
  while (( ( 0 < i ) && ( i < N ) )) {
    min = ( min < A[i] ) ? min : A[i];
    i = ( i + 1 );
  }

  return 0;
}

void* thread2() {
  max = A[0];
  b2 = 1;
  while (( ( 0 < j ) && ( j < N ) )) {
    max = ( max > A[j] ) ? max : A[j];
    j = ( j + 1 );
  }

  return 0;
}

void* thread3() {
  v_assert = ( !b1 || !b2  || ( min <= max ) );

  return 0;
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  min = __VERIFIER_nondet_int();
  max = __VERIFIER_nondet_int();
  i   = __VERIFIER_nondet_int();
  j   = __VERIFIER_nondet_int();
  N   = __VERIFIER_nondet_int();
  b1 = __VERIFIER_nondet_bool();
  b2 = __VERIFIER_nondet_bool();
  v_assert = __VERIFIER_nondet_bool();
  A = create_fresh_int_array(N);

  // main method
  assume_abort_if_not( ( i == j && i == 0 ) && ( min == max && min == A[0] ) && ( v_assert == b1 && v_assert == b2 && v_assert == 0 ) );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  assume_abort_if_not( !v_assert );
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
