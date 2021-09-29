#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int  __VERIFIER_nondet_int(void);

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int x1, x2, n;

void* thread1() {
  while (x1 < n) {
    x1 = x1 + x1;
  }

  return 0;
}

void* thread2() {
  while (x2 < n) {
    x2 = x2 + x2;
  }

  return 0;
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  x1 = __VERIFIER_nondet_int();
  x2 = __VERIFIER_nondet_int();
  n  = __VERIFIER_nondet_int();

  // main method
  assume_abort_if_not( x1 == x2 && x1 > 0 );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not( x1 != x2 );
  reach_error();
}
