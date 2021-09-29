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

_Bool e1, e2;
int n1, n2, tmp1, tmp2, i, i1, i2;


void* thread1() {
  e1 = 1;
  tmp1 = n2;
  n1 = tmp1 + 1;
  e1 = 0;
  assume_abort_if_not(!e2);
  assume_abort_if_not(n2 == 0 || n2 >= n1);
  i1 = i;
  i = i1 + 1;
  n1 = 0;
}

void* thread2() {
  e2 = 1;
  tmp2 = n1;
  n2 = tmp2 + 1;
  e2 = 0;
  assume_abort_if_not(!e1);
  assume_abort_if_not(n1 == 0 || n1 > n2);
  i2 = i;
  i = i2 + 1;
  n2 = 0;
}

void main() {
  pthread_t t1, t2;
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(i != 2);
  reach_error();
}
