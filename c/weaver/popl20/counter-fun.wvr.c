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

int *f, *f_inv;
int counter, N, n, n_inv;

int *create_fresh_int_array(int size);

void* thread1() {
  for (int i=0; i<N; i++) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(counter >= 0 && counter < n);
    assume_abort_if_not(f[counter] >= 0 && f[counter] < n_inv);
    assume_abort_if_not(f_inv[f[counter]] == counter);
    counter = f[counter];
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  for (int i=0; i<N; i++) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(counter >= 0 && counter < n_inv);
    assume_abort_if_not(f_inv[counter] >= 0 && f_inv[counter] < n);
    assume_abort_if_not(f[f_inv[counter]] == counter);
    counter = f_inv[counter];
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2;
  
  N = __VERIFIER_nondet_int();
  n = __VERIFIER_nondet_int();
  n_inv = __VERIFIER_nondet_int();
  f = create_fresh_int_array(n);
  f_inv = create_fresh_int_array(n_inv);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  
  assume_abort_if_not(counter != 0);
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