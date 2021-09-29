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

int pos, c1, c2;
_Bool v_assert;

void* thread1() {
  while (v_assert) {
    if (__VERIFIER_nondet_bool()) {
      __VERIFIER_atomic_begin();
      pos++;
      c1++;
      __VERIFIER_atomic_end();
    }
    else {
      __VERIFIER_atomic_begin();
      assume_abort_if_not(c1 > 0);
      pos--;
      c1--;
      __VERIFIER_atomic_end();
    }
  }

  return 0;
}

void* thread2() {
  while (v_assert) {
    if (__VERIFIER_nondet_bool()) {
      __VERIFIER_atomic_begin();
      pos++;
      c2++;
      __VERIFIER_atomic_end();
    }
    else {
      __VERIFIER_atomic_begin();
      assume_abort_if_not(c2 > 0);
      pos--;
      c1--;
      __VERIFIER_atomic_end();
    }
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
  c1  = __VERIFIER_nondet_int();
  c2  = __VERIFIER_nondet_int();
  v_assert  = __VERIFIER_nondet_bool();

  // main method
  assume_abort_if_not( ( pos == c1 && pos == c2 && pos == 0 ) && ( v_assert == 1 ) );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  reach_error();
}
