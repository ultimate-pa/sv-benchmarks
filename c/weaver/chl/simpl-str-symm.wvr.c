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

int length_0, to_int_1, length_2, to_int_3, result_4, result_5;

void* thread1() {
  result_4 = length_0 == 0 ? (length_2 == 0 ? 0 : 1) : (length_2 == 0 ? -1 : to_int_1 - to_int_3);
}

void* thread2() {
  result_5 = length_2 == 0 ? (length_0 == 0 ? 0 : 1) : (length_0 == 0 ? -1 : to_int_3 - to_int_1);
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  length_0 = __VERIFIER_nondet_int();
  to_int_1 = __VERIFIER_nondet_int();
  length_2 = __VERIFIER_nondet_int();
  to_int_3 = __VERIFIER_nondet_int();

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(!(result_4 < 0 && result_5 > 0));
  assume_abort_if_not(!(result_4 > 0 && result_5 < 0));
  assume_abort_if_not(!(result_4 == 0 && result_5 == 0));
  reach_error();
}