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

int p1, p2, n1, n2, m;

void* thread1() {
  while (n1 > 0) {
    __VERIFIER_atomic_begin();
    if (n1 > 0) {
      p1 = p1 + m;
      n1--;
    }
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  while (n1 > 1) {
    __VERIFIER_atomic_begin();
    if (n1 > 1) {
      p1 = p1 + 2 * m;
      n1 = n1 - 2;
    }
    __VERIFIER_atomic_end();
  }
}

void* thread3() {
  while (n2 > 0) {
  __VERIFIER_atomic_begin();
    if (n2 > 0) {
      p2 = p2 + m;
      n2--;
    }
    __VERIFIER_atomic_end();
  }
}

void* thread4() {
  while (n2 > 1) {
  __VERIFIER_atomic_begin();
    if (n2 > 1) {
      p2 = p2 + 2 * m;
      n2 = n2 - 2;
    }
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2, t3, t4;
  
  p1 = __VERIFIER_nondet_int();
  p2 = __VERIFIER_nondet_int();
  n1 = __VERIFIER_nondet_int();
  n2 = __VERIFIER_nondet_int();
  m  = __VERIFIER_nondet_int();
  assume_abort_if_not(p1 == p2 && n1 == n2);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  pthread_join(t4, 0);

  assume_abort_if_not(p1 != p2);
  reach_error();
}