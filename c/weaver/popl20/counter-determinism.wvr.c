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

int N, counter1, counter2;

void* thread1() {
  for (int i=0; i<N; i++) {
    __VERIFIER_atomic_begin();
    counter1++;
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  for (int i=0; i<N; i++) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(counter1 > 0);
    counter1--;
  __VERIFIER_atomic_end();
  }
}

void* thread3() {
  for (int i=0; i<N; i++) {
    __VERIFIER_atomic_begin();
    counter2++;
    __VERIFIER_atomic_end();
  }
}

void* thread4() {
  for (int i=0; i<N; i++) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(counter2 > 0);
    counter2--;
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2, t3, t4;
  
  N = __VERIFIER_nondet_int();
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  pthread_join(t4, 0);
  
  assume_abort_if_not(counter1 != counter2);
  reach_error();
}