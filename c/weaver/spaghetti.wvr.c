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

int x_0, x_1;


void* thread1() {
  while (__VERIFIER_nondet_bool()) {
    x_0 = __VERIFIER_nondet_int();
    x_0 = x_0 + 3;
    x_0 = 2 * x_0;
  }
  x_0 = 0;
}

void* thread2() {
  while (__VERIFIER_nondet_bool()) {
    x_0 = x_0 * 10;
    x_0 = x_0 + x_0;
  }
  x_0 = 0;
}

void* thread3() {
  while (__VERIFIER_nondet_bool()) {
    x_1 = __VERIFIER_nondet_int();
    x_1 = x_1 + 3;
    x_1 = 2 * x_1;
  }
  x_1 = 0;
}

void* thread4() {
  while (__VERIFIER_nondet_bool()) {
    x_1 = x_1 * 10;
    x_1 = x_1 + x_1;
  }
  x_1 = 0;
}

void main() {
  pthread_t t1, t2, t3, t4;
  
  x_0 = __VERIFIER_nondet_int();
  x_1 = __VERIFIER_nondet_int();
  
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  pthread_join(t4, 0);
  
  assume_abort_if_not(x_0 != x_1);
  reach_error();
}
