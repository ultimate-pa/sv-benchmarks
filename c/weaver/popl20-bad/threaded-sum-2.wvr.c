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

int s, t, m, T, S;

void* thread1() {
  while (s > 0 || t > 0) {
    if (s > 0) {
      __VERIFIER_atomic_begin();
      s--;
      m++;
      __VERIFIER_atomic_end();
    }
  }
}

void* thread2() {
  while (t > 0) {
    __VERIFIER_atomic_begin();
    s++;
    __VERIFIER_atomic_end();
    __VERIFIER_atomic_begin();
    t--;
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2;
  
  s = __VERIFIER_nondet_int();
  t = __VERIFIER_nondet_int();
  S = s;
  T = t;

  assume_abort_if_not(s > 0 && t > 0);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  
  assume_abort_if_not(m != S + T);
  reach_error();
}