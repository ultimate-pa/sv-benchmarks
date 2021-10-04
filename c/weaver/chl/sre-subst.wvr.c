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

int result_3, result_4, result_5;
_Bool sponsored_0, sponsored_1, sponsored_2;

void* thread1() {
  result_3 = !!sponsored_0 == !!sponsored_1 ? 0 : (sponsored_1 ? -1 : 1);
}

void* thread2() {
  result_4 = !!sponsored_0 == !!sponsored_2 ? 0 : (sponsored_2 ? -1 : 1);
}

void* thread3() {
  result_5 = !!sponsored_1 == !!sponsored_2 ? 0 : (sponsored_2 ? -1 : 1);
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  sponsored_0 = __VERIFIER_nondet_bool();
  sponsored_1 = __VERIFIER_nondet_bool();
  sponsored_2 = __VERIFIER_nondet_bool();

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  assume_abort_if_not(result_3 == 0);
  assume_abort_if_not((result_4 > 0) != (result_5 > 0) || (result_4 < 0) != (result_5 < 0));
  reach_error();
}