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

int count, pos;
_Bool sFlag, sEvent, stopped, v_assert;

void* thread1() {
  __VERIFIER_atomic_begin();
  count = sFlag ? count : (count + 1);
  v_assert = ( sFlag || !stopped );
  __VERIFIER_atomic_end();

  count--;
  if (( count == 0 )) {
    sEvent = 1;
  }

  return 0;
}

void* thread2() {
  sFlag = 1;
  count--;
  if (( count == 0 )) {
    sEvent = 1;

  }
  assume_abort_if_not(sEvent);
  stopped = 1;

  return 0;
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  count = __VERIFIER_nondet_int();
  pos   = __VERIFIER_nondet_int();
  sFlag = __VERIFIER_nondet_bool();
  sEvent = __VERIFIER_nondet_bool();
  stopped = __VERIFIER_nondet_bool();
  v_assert = __VERIFIER_nondet_bool();

  // main method
  assume_abort_if_not( pos == 0 );
  assume_abort_if_not( count == 1 );
  assume_abort_if_not( sFlag == 0 );
  assume_abort_if_not( sEvent == 0 );
  assume_abort_if_not( stopped == 0 );
  assume_abort_if_not( v_assert == 1 );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not( !v_assert );
  reach_error();
}
