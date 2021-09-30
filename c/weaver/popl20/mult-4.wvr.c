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

int N, counter, c;

void* thread1() {
  for (int i=0; i<N; i++) {
    counter = counter + c;
  }
}

void* thread2() {
  for (int i=0; i<N; i++) {
    __VERIFIER_atomic_begin();
	assume_abort_if_not(counter > 0);
    counter = counter - c;
	__VERIFIER_atomic_end();
  }
}

void* thread3() {
  for (int i=0; i<N; i++) {
    counter = counter + c;
  }
}

void* thread4() {
  for (int i=0; i<N; i++) {
    __VERIFIER_atomic_begin();
	assume_abort_if_not(counter > 0);
    counter = counter - c;
	__VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2, t3, t4;
  
  N = __VERIFIER_nondet_int();
  c = __VERIFIER_nondet_int();
  
  assume_abort_if_not(c > 0);
  
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