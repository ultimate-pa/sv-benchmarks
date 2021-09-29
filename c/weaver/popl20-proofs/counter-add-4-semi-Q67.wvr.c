#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int  __VERIFIER_nondet_int(void);
extern void __VERIFIER_atomic_begin(void);
extern void __VERIFIER_atomic_end(void);

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int i1, i2, N1, N2, counter, j1, j2, M1, M2;

void* thread1() {
  while (i1 < N1) {
    __VERIFIER_atomic_begin();
    counter++;
    i1++;
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  while (i2 < N2) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(0 < counter);
    counter--;
    i2++;
    __VERIFIER_atomic_end();
  }
}

void* thread3() {
  while (j1 < M1) {
    __VERIFIER_atomic_begin();
    counter++;
    j1++;
    __VERIFIER_atomic_end();
  }
}

void* thread4() {
  while (j2 < M2) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(0 < counter);
    counter--;
    j2++;
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2, t3, t4;
  
  N1 = __VERIFIER_nondet_int();
  N2 = __VERIFIER_nondet_int();
  M1 = __VERIFIER_nondet_int();
  M2 = __VERIFIER_nondet_int();
  assume_abort_if_not(N1 == N2 && N1 == M1 && N1 == M2);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  pthread_join(t4, 0);
  
  assume_abort_if_not(counter != 0);
  reach_error();
}