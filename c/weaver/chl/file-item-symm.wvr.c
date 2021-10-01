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

int filename_1, filename_4, result_6, result_7;
_Bool isNull_0, isNull_3, filename_2, filename_5;

void* thread1() {
  result_6 = isNull_0 ? (isNull_3 ? 0 : 1) : (isNull_3 ? -1 : (filename_2 ? (filename_5 ? 0 : 1) : (filename_5 ? -1 : filename_1 - filename_4)));
}

void* thread2() {
  result_7 = isNull_3 ? (isNull_0 ? 0 : 1) : (isNull_0 ? -1 : (filename_5 ? (filename_2 ? 0 : 1) : (filename_2 ? -1 : filename_4 - filename_1)));
}

void main() {
  pthread_t t1, t2;
  
  filename_1 = __VERIFIER_nondet_int();
  filename_4 = __VERIFIER_nondet_int();
  isNull_0 = __VERIFIER_nondet_bool();
  isNull_3 = __VERIFIER_nondet_bool();
  filename_2 = __VERIFIER_nondet_bool();
  filename_5 = __VERIFIER_nondet_bool();
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(!(result_6 < 0 && result_7 > 0));
  assume_abort_if_not(!(result_6 > 0 && result_7 < 0));
  assume_abort_if_not(!(result_6 == 0 && result_7 == 0));
  reach_error();
}