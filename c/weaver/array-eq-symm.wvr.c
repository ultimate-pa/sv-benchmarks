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

int *A;
int *B;
int i_AB, i_BA, An, Bn;
_Bool break_AB, break_BA;

int *create_fresh_int_array(int size);

void* thread1() {
  while (i_AB < An && i_AB < Bn && !break_AB) {
    if (A[i_AB] == B[i_AB]) {
      i_AB++;
    } else {
      break_AB = 1;
    }
  }

  return 0;
}

void* thread2() {
  while (i_BA < Bn && i_BA < An && !break_BA) {
    if (B[i_BA] == A[i_BA]) {
      i_BA++;
    } else {
      break_BA = 1;
    }
  }

  return 0;
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  An = __VERIFIER_nondet_int();
  Bn = __VERIFIER_nondet_int();
  A = create_fresh_int_array(An);
  B = create_fresh_int_array(Bn);
  break_AB = 0;
  break_BA = 0;

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not( i_AB != i_BA );
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
