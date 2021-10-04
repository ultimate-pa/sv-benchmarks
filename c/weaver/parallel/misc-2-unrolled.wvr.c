#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int   __VERIFIER_nondet_int(void);
extern void  __VERIFIER_atomic_begin();
extern void  __VERIFIER_atomic_end();

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int pos, i1, i2, N;

void* thread1() {
  while (( i1 < ( 2 * N ) )) {
    __VERIFIER_atomic_begin();
    pos++;
    __VERIFIER_atomic_end();
    i1++;
    __VERIFIER_atomic_begin();
    pos--;
    __VERIFIER_atomic_end();
    i1++;
  }

  return 0;
}

void* thread2() {
  while (( i2 < ( 2 * N ) )) {
    pos = ( pos + 2 );
    i2++;
    pos = ( pos - 2 );
    i2++;
  }

  return 0;
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  pos = __VERIFIER_nondet_int();
  i1  = __VERIFIER_nondet_int();
  i2  = __VERIFIER_nondet_int();
  N   = __VERIFIER_nondet_int();

  // main method
  assume_abort_if_not( pos == i1 && pos == i2 && pos == 0 );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not( pos != 0 );
  reach_error();
}
