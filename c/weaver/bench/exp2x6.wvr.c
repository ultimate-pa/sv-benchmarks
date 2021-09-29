#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int  __VERIFIER_nondet_int(void);

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int x1, x2, x3, x4, n;

void* thread1() {
  while (x1 < n) {
    x1 = x1 + x1;
    x1 = x1 + x1;
    x1 = x1 + x1;
    x1 = x1 + x1;
  }

  return 0;
}

void* thread2() {
  while (x2 < n) {
    x2 = x2 + x2;
    x2 = x2 + x2;
    x2 = x2 + x2;
    x2 = x2 + x2;
  }

  return 0;
}

void* thread3() {
  while (x3 < n) {
    x3 = x3 + x3;
    x3 = x3 + x3;
    x3 = x3 + x3;
    x3 = x3 + x3;
  }

  return 0;
}

void* thread4() {
  while (x4 < n) {
    x4 = x4 + x4;
    x4 = x4 + x4;
    x4 = x4 + x4;
    x4 = x4 + x4;
  }

  return 0;
}

void main() {
  pthread_t t1, t2, t3, t4;

  // initialize global variables
  x1 = __VERIFIER_nondet_int();
  x2 = __VERIFIER_nondet_int();
  x3 = __VERIFIER_nondet_int();
  x4 = __VERIFIER_nondet_int();
  n  = __VERIFIER_nondet_int();

  // main method
  assume_abort_if_not( x1 == x2 && x1 > 0 && x3 == x4 && x3 > 0 );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  pthread_join(t4, 0);

  assume_abort_if_not( x1 != x2 || x3 != x4 );
  reach_error();
}
