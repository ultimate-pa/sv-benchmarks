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

int x_1, x_2, x_3, a, b, c;


void* thread1() {
  for (int i=0; i<c; i++) {
    x_1 = x_1 + a;
  }
}

void* thread2() {
  for (int i=0; i<c; i++) {
    x_2 = x_2 + b;
  }
}

void* thread3() {
  for (int i=0; i<c; i++) {
    x_3 = x_3 + (a + b);
  }
}

void main() {
  pthread_t t1, t2, t3;
  
  // initialize global variables
  a = __VERIFIER_nondet_int();
  b = __VERIFIER_nondet_int();
  c = __VERIFIER_nondet_int();
  
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
  assume_abort_if_not(x_1 + x_2 != x_3);
  reach_error();
}
