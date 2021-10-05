#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int   __VERIFIER_nondet_int(void);
extern _Bool __VERIFIER_nondet_bool(void);
extern void  __VERIFIER_atomic_begin();
extern void  __VERIFIER_atomic_end();

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int pos;
_Bool d1, d2, g1, g2;

void* thread1() {
  while (g1) {
    if (d1) {
      __VERIFIER_atomic_begin();
      pos++;
      __VERIFIER_atomic_end();
    } else {
      __VERIFIER_atomic_begin();
      pos--;
      __VERIFIER_atomic_end();
    }
    d1 = !d1;
    if (d1) {
      if (__VERIFIER_nondet_bool()) {
        g1 = 0;
      }
    }
  }

  return 0;
}

void* thread2() {
  while (g2) {
    if (d2) {
      pos = ( pos + 2 );
    } else {
      pos = ( pos - 2 );
    }
    d2 = !d2;
    if (d2) {
      if (__VERIFIER_nondet_bool()) {
        g2 = 0;
      }
    }
  }

  return 0;
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  d1 = 1;
  d2 = 1;
  g1 = 1;
  g2 = 1;

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(pos != 0);
  reach_error();
}
