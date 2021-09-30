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

int s, t, m, c, T, S, u, U;

void* thread1() {
  while (s > 0 || t > 0 || u > 0) {
    __VERIFIER_atomic_begin();
	if (s > 0) {
      s--;
      m++;	  
	}
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  while (t > 0 || u > 0) {
    __VERIFIER_atomic_begin();
	if (t > 0) {
      t--;
      s++;	  
	}
	__VERIFIER_atomic_end();
  }
}

void* thread3() {
  while (u > 0) {
	__VERIFIER_atomic_begin();
    t++;
	__VERIFIER_atomic_end();
	__VERIFIER_atomic_begin();
    u--;
	__VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2, t3;
  
  S = __VERIFIER_nondet_int();
  T = __VERIFIER_nondet_int();
  U = __VERIFIER_nondet_int();
  s = S;
  t = T;
  u = U;
  
  assume_abort_if_not(S > 0 && T > 0 && U > 0);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);;
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
  assume_abort_if_not(m != S + T + U);
  reach_error();
}