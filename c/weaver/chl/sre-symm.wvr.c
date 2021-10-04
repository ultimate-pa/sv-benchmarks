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

int result_2, result_3;
_Bool sponsored_0, sponsored_1;

void* thread1() {
  result_2 = !!sponsored_0 == !!sponsored_1 ? 0 : (sponsored_1 ? -1 : 1);
}

void* thread2() {
  result_3 = !!sponsored_1 == !!sponsored_0 ? 0 : (sponsored_0 ? -1 : 1);
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  sponsored_0 = __VERIFIER_nondet_bool();
  sponsored_1 = __VERIFIER_nondet_bool();

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(!(result_2 < 0 && result_3 > 0));
  assume_abort_if_not(!(result_2 > 0 && result_3 < 0));
  assume_abort_if_not(!(result_2 == 0 && result_3 == 0));
  reach_error();
}