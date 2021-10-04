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
int i1, i2, t11, t21, t12, t22, s11, s21, s12, s22, x1, x2, n;

int *create_fresh_int_array(int size);

void* thread2() {
  while ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( i1 < n );
    i1++;
    t11 = x[i1];
    __VERIFIER_atomic_end();
    s11 = ( s11 + t11 );
  }

  return 0;
}

void* thread3() {
  while ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( i1 < n );
    i1++;
    t21 = x[i1];
    __VERIFIER_atomic_end();
    s21 = ( s21 + t21 );
  }

  return 0;
}

void* thread1() {
  pthread_t t2, t3;

  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  assume_abort_if_not( i1 == n );
  x1 = s11 + s21;

  return 0;
}

void* thread5() {
  while ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( i2 < n );
    i2++;
    t12 = x[i2];
    __VERIFIER_atomic_end();
    s12 = ( s12 + t12 );
  }

  return 0;
}

void* thread6() {
  while ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( i2 < n );
    i2++;
    t22 = x[i2];
    __VERIFIER_atomic_end();
    s22 = ( s22 + t22 );
  }

  return 0;
}

void* thread4() {
  pthread_t t5, t6;

  pthread_create(&t5, NULL, thread5, NULL);
  pthread_create(&t6, NULL, thread6, NULL);
  pthread_join(t5, 0);
  pthread_join(t6, 0);

  assume_abort_if_not ( i2 == n );
  x2 = s12 + s22;

  return 0;
}

void main() {
  pthread_t t1, t4;

  // initialize global variables
  i1  = __VERIFIER_nondet_int();
  i2  = __VERIFIER_nondet_int();
  t11 = __VERIFIER_nondet_int();
  t21 = __VERIFIER_nondet_int();
  t12 = __VERIFIER_nondet_int();
  t22 = __VERIFIER_nondet_int();
  s11 = __VERIFIER_nondet_int();
  s21 = __VERIFIER_nondet_int();
  s22 = __VERIFIER_nondet_int();
  x1  = __VERIFIER_nondet_int();
  x2  = __VERIFIER_nondet_int();
  n   = __VERIFIER_nondet_int();
  x = create_fresh_int_array(n + 1);
  assume_abort_if_not(s11 == s21 && s11 == s12 && s11 == s22 && s11 == i1 && s11 == i2 && s11 == 0);

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t4, 0);

  assume_abort_if_not( !(x1 == x2) );
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
