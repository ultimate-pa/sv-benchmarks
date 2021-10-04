#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int __VERIFIER_nondet_int(void);
extern _Bool __VERIFIER_nondet_bool(void);
extern void __VERIFIER_atomic_begin();
extern void __VERIFIER_atomic_end();

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int n_0, f1_2, f2_3, l_4, f1_6, f2_7, l_8;

void* thread1() {
  for (int i=0; i<n_0; i++) {
    __VERIFIER_atomic_begin();
    f1_2 = f1_2 + f2_3;
    f2_3 = f1_2 - f2_3;
    __VERIFIER_atomic_end();
  }
  l_4 = (f1_2 > 0) ? 1 : 0;

  return 0;
}

void* thread2() {
  for (int i=0; i<n_0; i++) {
    __VERIFIER_atomic_begin();
    f1_6 = f1_6 + f2_7;
    f2_7 = f1_6 - f2_7;
    __VERIFIER_atomic_end();
  }
  l_8 = (f1_6 > 0) ? 1 : 0;

  return 0;
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  n_0  = __VERIFIER_nondet_int();
  f1_2 = __VERIFIER_nondet_int();
  f2_3 = __VERIFIER_nondet_int();
  l_4  = __VERIFIER_nondet_int();
  f1_6 = __VERIFIER_nondet_int();
  f2_7 = __VERIFIER_nondet_int();
  l_8  = __VERIFIER_nondet_int();

  // main method
  assume_abort_if_not(f1_2 == f1_6 && f2_3 == f2_7);

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(l_4 != l_8);
  reach_error();
}

