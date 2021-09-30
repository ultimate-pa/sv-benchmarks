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

_Bool e1, e2;
int n1, n2, tmp1, tmp2, i, j, i1, i2, n;
int* f;

int *create_fresh_int_array(int size);

void* thread1() {
  e1 = 1;
  tmp1 = n2;
  n1 = ( tmp1 + 1 );
  e1 = 0;
  assume_abort_if_not( !e2 );
  assume_abort_if_not( ( n2 == 0 ) || ( n2 >= n1 ) );
  i1 = i;
  i = f[i1];
  assume_abort_if_not(i < n);
  n1 = 0;

  return 0;
}

void* thread2() {
  e2 = 1;
  tmp2 = n1;
  n2 = ( tmp2 + 1 );
  e2 = 0;
  assume_abort_if_not( !e1 );
  assume_abort_if_not ( ( n1 == 0 ) || ( n1 > n2 ) );
  i2 = i;
  i = f[i2];
  assume_abort_if_not(i < n);
  n2 = 0;

  return 0;
}

void* thread3() {
  j = f[j];
  assume_abort_if_not(j < n);
  j = f[j];

  return 0;
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  tmp1 = __VERIFIER_nondet_int();
  tmp2 = __VERIFIER_nondet_int();
  i  = __VERIFIER_nondet_int();
  j  = __VERIFIER_nondet_int();
  i1 = __VERIFIER_nondet_int();
  i2 = __VERIFIER_nondet_int();
  n  = __VERIFIER_nondet_int();
  f  = create_fresh_int_array(n);

  // main method
  assume_abort_if_not( i == j );
  assume_abort_if_not( i < n );

  e1 = 0;
  e2 = 0;
  n1 = 0;
  n2 = 0;

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  assume_abort_if_not( !( i == j ) );
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
