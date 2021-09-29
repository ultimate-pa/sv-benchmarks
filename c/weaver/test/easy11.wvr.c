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

int X, Y;

void* thread1() {
  int x;
  x = X;
  while (x < 10000) {
    x++;
  }
  Y = Y + x;
}

void* thread2() {
  int x;
  x = X;
  while (x < 10000) {
    x++;
  }
  Y = Y + x;
}

void main() {
  pthread_t t1, t2;
  
  X = __VERIFIER_nondet_int();
  assume_abort_if_not(X <= 10000);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(Y != 20000);
  reach_error();
}