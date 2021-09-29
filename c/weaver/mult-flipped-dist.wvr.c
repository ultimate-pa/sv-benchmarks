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

int x_1, x_2, x_3, i_1, i_2, i_3, a, b, c;


void* thread1() {
  while (i_1 < c) {
    __VERIFIER_atomic_begin();
    x_1 = x_1 + a;
    i_1++;
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  while (i_2 < c) {
    __VERIFIER_atomic_begin();
    x_2 = x_2 + b;
    i_2++;
    __VERIFIER_atomic_end();
  }
}

void* thread3() {
  while (i_3 < c) {
    __VERIFIER_atomic_begin();
    x_3 = x_3 + (a + b);
    i_3++;
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2, t3;
  
  // initialize global variables
  x_1 = 0;
  x_2 = 0;
  x_3 = 0;
  i_1 = 0;
  i_2 = 0;
  i_3 = 0;
  a   = __VERIFIER_nondet_int();
  b   = __VERIFIER_nondet_int();
  c   = __VERIFIER_nondet_int();
  
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
  assume_abort_if_not(x_1 + x_2 != x_3);
  reach_error();
}
