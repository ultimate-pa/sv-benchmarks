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

int m1, m2, m3, s, t, x;
_Bool b;

void* thread1() {
  __VERIFIER_atomic_begin();
  m1 = t;
  t++;
  __VERIFIER_atomic_end();

  assume_abort_if_not( m1 <= s );
  x = 1;
  x = 0;
  s++;

  return 0;
}

void* thread2() {
  __VERIFIER_atomic_begin();
  m2 = t;
  t++;
  __VERIFIER_atomic_end();

  assume_abort_if_not( m2 <= s );
  b = b || x == 1;
  s++;

  return 0;
}

void* thread3() {
  __VERIFIER_atomic_begin();
  m3 = t;
  t++;
  __VERIFIER_atomic_end();

  assume_abort_if_not( m3 <= s );
  b = b || x == 1;
  s++;

  return 0;
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  m1 = __VERIFIER_nondet_int();
  m2 = __VERIFIER_nondet_int();
  m3 = __VERIFIER_nondet_int();
  s  = __VERIFIER_nondet_int();
  t  = __VERIFIER_nondet_int();
  x  = __VERIFIER_nondet_int();
  b  = __VERIFIER_nondet_bool();

  // main method
  assume_abort_if_not( s == t && s == x && s == 0 && b == 0 );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  assume_abort_if_not(b);
  reach_error();
}
