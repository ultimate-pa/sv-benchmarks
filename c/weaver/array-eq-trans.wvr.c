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
int *C;
int i_AB, i_BC, i_AC, An, Bn, Cn;

int *create_fresh_int_array(int size);

void* thread1() {
  while (i_AB < An && i_AB < Bn) {
    if (A[i_AB] == B[i_AB]) {
      i_AB++;
    } else {
      break;
    }
  }
  return 0;
}

void* thread2() {
  while (i_BC < Bn && i_BC < Cn) {
    if (B[i_BC] == C[i_BC]) {
      i_BC++;
    } else {
      break;
    }
  }
  return 0;
}

void* thread3() {
  while (i_AC < An && i_AC < Cn) {
    if (A[i_AC] == C[i_AC]) {
      i_AC++;
    } else {
      break;
    }
  }
  return 0;
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  An = __VERIFIER_nondet_int();
  Bn = __VERIFIER_nondet_int();
  Cn = __VERIFIER_nondet_int();
  A = create_fresh_int_array(An);
  B = create_fresh_int_array(Bn);
  C = create_fresh_int_array(Cn);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
  assume_abort_if_not(i_AB == An || (i_AB < Bn && A[i_AB] <= B[i_AB]));
  assume_abort_if_not(i_BC == Bn || (i_BC < Cn && B[i_BC] <= C[i_BC]));
  assume_abort_if_not(!(i_AC == An || (i_AC < Cn && A[i_AC] <= C[i_AC])));
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
