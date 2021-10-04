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

int L, M, N, p, q;

void* thread1() {
  while (N > 0) {
    __VERIFIER_atomic_begin();
    if (N > 0) {
      p = p + M;
      N--;
    }
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  while (N > 1) {
    __VERIFIER_atomic_begin();
    if (N > 1) {
      p = p + M + M;
      N = N - 2;
    }
    __VERIFIER_atomic_end();
  }
}

void* thread3() {
  while (L > 0) {
    __VERIFIER_atomic_begin();
    q = q + M;
    L--;
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2, t3;
  
  L = __VERIFIER_nondet_int();
  M = __VERIFIER_nondet_int();
  N = L;
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
  assume_abort_if_not(p != q);
  reach_error();
}