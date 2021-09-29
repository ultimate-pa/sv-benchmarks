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

int y, x1, z1, l1, x2, z2, l2;


void* thread1() {
  z1 = 1;
  if (__VERIFIER_nondet_bool()) {
    x1 = 1;
  } else {
    x1 = z1;
  }
  l1 = x1 + y;
}

void* thread2() {
  z2 = 1;
  if (__VERIFIER_nondet_bool()) {
    x2 = 1;
  } else {
    x2 = z2;
  }
  l2 = x2 + y;
}

void main() {
  pthread_t t1, t2;
  
  y = __VERIFIER_nondet_int();
  
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  
  assume_abort_if_not(l1 != l2);
  reach_error();
}
