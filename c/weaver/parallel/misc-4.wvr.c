#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int   __VERIFIER_nondet_int(void);
extern _Bool __VERIFIER_nondet_bool(void);

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int pos;
_Bool d1, d2, v_assert;

void* thread1() {
  while (v_assert) {
    if (d1) {
      pos++;

    }
    else {
      pos--;

    }
    d1 = !d1;
  }

  return 0;
}

void* thread2() {
  while (v_assert) {
    if (d2) {
      pos = ( pos + 2 );

    }
    else {
      pos = ( pos - 2 );

    }
    d2 = !d2;
  }

  return 0;
}

void* thread3() {
  v_assert = (pos >= 0);

  return 0;
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  pos = __VERIFIER_nondet_int();
  d1  = __VERIFIER_nondet_bool();
  d2  = __VERIFIER_nondet_bool();
  v_assert  = __VERIFIER_nondet_bool();

  // main method
  assume_abort_if_not( ( pos == 0 ) && ( d1 == d2 && d1 == 1 ) && ( v_assert == 1 ) );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  reach_error();
}
