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

int* x;
int i1, i2, t11, t21, t12, t22, s1, s2, n;

int *create_fresh_int_array(int size);

void* thread1() {
  while ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( i1 < n );
    i1++;
    t11 = x[i1];
    __VERIFIER_atomic_end();
  }
  s1 = s1 + t11;
}

void* thread2() {
  while ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( i1 < n );
    i1++;
    t21 = x[i1];
    __VERIFIER_atomic_end();
  }
  s1 = s1 + t21;
}

void* thread3() {
  while ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( i2 < n );
    i2++;
    t12 = x[i2];
    __VERIFIER_atomic_end();
  }
  s2 = s2 + t12;
}

void* thread4() {
  while ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( i2 < n );
    i2++;
    t22 = x[i2];
    __VERIFIER_atomic_end();
  }
  s2 = s2 + t22;
}

void main() {
  pthread_t t1, t2, t3, t4;

  // initialize global variables
  i1  = __VERIFIER_nondet_int();
  i2  = __VERIFIER_nondet_int();
  t11 = __VERIFIER_nondet_int();
  t21 = __VERIFIER_nondet_int();
  t12 = __VERIFIER_nondet_int();
  t22 = __VERIFIER_nondet_int();
  s1  = __VERIFIER_nondet_int();
  s2  = __VERIFIER_nondet_int();
  n   = __VERIFIER_nondet_int();
  x = create_fresh_int_array(n+1);

  // main method
  assume_abort_if_not( s1 == s2 && s1 == i1 && s1 == i2 && s1 == 0 );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  pthread_join(t4, 0);

  assume_abort_if_not( ( i1 == i2 && i1 == n ) && !( s1 == s2 ) );
  reach_error();
}

int *create_fresh_int_array(int size) {
  assume_abort_if_not(size >= 0);

  int* arr = (int*)malloc(sizeof(int) * size);
  for (int i = 0; i < size; i++) {
    arr[i] = __VERIFIER_nondet_int();
  }
  return arr;
}
