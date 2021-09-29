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

_Bool e1, e2, e3;
int n1, n2, n3, i, i1, i2, i3;

void* thread1() {
  e1 = 1;
  n1 = (n1 < n2) ? n2 : n1;
  n1 = (n1 < n3) ? n3 : n1;
  n1++;
  e1 = 0;

  assume_abort_if_not(!e2);
  assume_abort_if_not( !( ( n2 != 0 ) && ( ( n2 < n1 ) || ( ( n2 == n1 ) && ( 2 < 1 ) ) ) ) );
  assume_abort_if_not(!e3);
  assume_abort_if_not( !( ( n3 != 0 ) && ( ( n3 < n1 ) || ( ( n3 == n1 ) && ( 3 < 1 ) ) ) ) );

  i1 = i;
  i = i1 + 1;
  n1 = 0;

  return 0;
}

void* thread2() {
  e2 = 1;
  n2 = (n2 < n1) ? n1 : n2;
  n2 = (n2 < n3) ? n3 : n2;
  n2++;
  e2 = 0;

  assume_abort_if_not(!e1);
  assume_abort_if_not( !( ( n1 != 0 ) && ( ( n1 < n2 ) || ( ( n1 == n2 ) && ( 1 < 2 ) ) ) ) );
  assume_abort_if_not(!e3);
  assume_abort_if_not( !( ( n3 != 0 ) && ( ( n3 < n2 ) || ( ( n3 == n2 ) && ( 3 < 2 ) ) ) ) );

  i2 = i;
  i = i2 + 1;
  n2 = 0;

  return 0;
}

void* thread3() {
  e3 = 1;
  n3 = (n3 < n1) ? n1 : n3;
  n3 = (n3 < n2) ? n2 : n3;
  n3++;
  e3 = 0;

  assume_abort_if_not(!e1);
  assume_abort_if_not( !( ( n1 != 0 ) && ( ( n1 < n3 ) || ( ( n1 == n3 ) && ( 1 < 3 ) ) ) ) );
  assume_abort_if_not(!e2);
  assume_abort_if_not( !( ( n2 != 0 ) && ( ( n2 < n3 ) || ( ( n2 == n3 ) && ( 2 < 3 ) ) ) ) );

  i3 = i;
  i = i3 + 1;
  n3 = 0;

  return 0;
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  e1 = __VERIFIER_nondet_bool();
  e2 = __VERIFIER_nondet_bool();
  e3 = __VERIFIER_nondet_bool();
  n1 = __VERIFIER_nondet_int();
  n2 = __VERIFIER_nondet_int();
  n3 = __VERIFIER_nondet_int();
  i  = __VERIFIER_nondet_int();
  i1 = __VERIFIER_nondet_int();
  i2 = __VERIFIER_nondet_int();
  i3 = __VERIFIER_nondet_int();

  // main method
  assume_abort_if_not( ( i == 0 ) && ( e1 == 0 ) && ( e2 == 0 ) && ( e3 == 0 ) && ( n1 == 0 ) && ( n2 == 0 ) && ( n3 == 0 ) );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  assume_abort_if_not( i != 3 );
  reach_error();
}
