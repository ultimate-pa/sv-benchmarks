#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int __VERIFIER_nondet_int();

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int n, m, i1, i2, j1, k1, k2;

void* thread1() {
  while (i1 < n) {
    for (j1 = 0; j1 < m; j1++) {
      k1++;
    }
    i1++;
  }
  return 0;
}

void* thread2() {
  while (i2 < n) {
    k2 = k2 + m;
    i2++;
  }
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  n = __VERIFIER_nondet_int();
  m = __VERIFIER_nondet_int();
  i1 = __VERIFIER_nondet_int();
  i2 = __VERIFIER_nondet_int();
  j1 = __VERIFIER_nondet_int();
  k1 = __VERIFIER_nondet_int();
  k2 = __VERIFIER_nondet_int();

  // main method
  assume_abort_if_not( i1 == i2 && i1 == k1 && i1 == k2 && i1 == 0 );
  assume_abort_if_not( m >= 0 );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not( !(k1 == k2) );
  reach_error();
}
