#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int  __VERIFIER_nondet_int(void);
extern void __VERIFIER_atomic_begin(void);
extern void __VERIFIER_atomic_end(void);

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int *f;
int i1, x1, i2, x2, n, size;

int *create_fresh_int_array(int size);


void* thread1() {
  while (i1 < n) {
    __VERIFIER_atomic_begin();
    x1 = f[x1];
    assume_abort_if_not(x1 >= 0 && x1 < size);
    i1++;
    __VERIFIER_atomic_end();
  }
  return 0;
}

void* thread2() {
  while (i2 < n - 1) {
    __VERIFIER_atomic_begin();
    x2 = f[x2];
    assume_abort_if_not(x2 >= 0 && x2 < size);
    i2++;
    x2 = f[x2];
    assume_abort_if_not(x2 >= 0 && x2 < size);
    i2++;
    __VERIFIER_atomic_end();
  }
  if (i2 < n) {
    x2 = f[x2];
    assume_abort_if_not(x2 >= 0 && x2 < size);
    i2++;
  }
  return 0;
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  n = __VERIFIER_nondet_int();
  size = __VERIFIER_nondet_int();
  f = create_fresh_int_array(size);

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(x1 != x2);
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