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

int length_0, to_int_1, length_2, to_int_3, length_4, to_int_5, result_6, result_7, result_8;

void* thread1() {
  result_6 = length_0 == 0 ? (length_2 == 0 ? 0 : 1) : (length_2 == 0 ? -1 : to_int_1 - to_int_3);
}

void* thread2() {
  result_7 = length_0 == 0 ? (length_4 == 0 ? 0 : 1) : (length_4 == 0 ? -1 : to_int_1 - to_int_5);
}

void* thread3() {
  result_8 = length_2 == 0 ? (length_4 == 0 ? 0 : 1) : (length_4 == 0 ? -1 : to_int_3 - to_int_5);
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  length_0 = __VERIFIER_nondet_int();
  to_int_1 = __VERIFIER_nondet_int();
  length_2 = __VERIFIER_nondet_int();
  to_int_3 = __VERIFIER_nondet_int();
  length_4 = __VERIFIER_nondet_int();
  to_int_5 = __VERIFIER_nondet_int();

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  assume_abort_if_not(result_6 == 0);
  assume_abort_if_not((result_7 > 0) != (result_8 > 0) || (result_7 < 0) != (result_8 < 0));
  reach_error();
}