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

int M1, M2, counter;

void* thread1() {
  for (int i=0; i<M1; i++) {
    __VERIFIER_atomic_begin();
    counter++;
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  int i = 0;
  while (i < M2) {
    __VERIFIER_atomic_begin();
    if (counter > 0) {
      counter--;
      i++;
    }
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2;
  
  M1 = __VERIFIER_nondet_int();
  M2 = __VERIFIER_nondet_int();
  assume_abort_if_not(M1 > 0 && M2 > 0);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  
  assume_abort_if_not(counter != M1 - M2);
  reach_error();
}