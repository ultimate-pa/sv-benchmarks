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

int *A, *B, *C;
int maxa, maxb, maxc, N, p;

int *create_fresh_int_array(int size);

void* thread1() {
  for (int i=1; i<N; i++) {
    if (maxa <= A[i]) {
      maxa = A[i];
    }
    if (maxb <= B[i]) {
      maxb = B[i];
    }
  }
}

void* thread2() {
  for (int i=1; i<N; i++) {
    __VERIFIER_atomic_begin();
    C[i] = A[i] + B[i];
    p = i + 1;
    __VERIFIER_atomic_end();
  }
}

void* thread3() {
  int i = 1;
  while (i < N) {
    if (i < p) {
      if (maxc <= C[i]) {
        maxc = C[i];
      }
      i++;
    }
  }
}

void main() {
  pthread_t t1, t2, t3;

  N = __VERIFIER_nondet_int();
  A = create_fresh_int_array(N);
  B = create_fresh_int_array(N);
  C = create_fresh_int_array(N);
  
  p = 1;
  
  maxa = A[0];
  maxb = B[0];
  maxc = A[0] + B[0];
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
  assume_abort_if_not(maxc > maxa + maxb);
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