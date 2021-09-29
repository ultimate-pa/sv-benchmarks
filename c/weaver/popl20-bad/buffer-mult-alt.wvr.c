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

int* q1;
int* q2;
int i, j, total, C, N, M, q1_front, q1_back, q2_front, q2_back, n1, n2;

int *create_fresh_int_array(int size);

void* thread1() {
  while (i < N) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q1_back >= 0 && q1_back < n1 && q1[q1_back] == C);
    q1_back++;
    __VERIFIER_atomic_end();
    i++;
  }
}

void* thread2() {
  while (j < M) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q2_back >= 0 && q2_back < n2 && q2[q2_back] == -C);
    q2_back++;
    __VERIFIER_atomic_end();
    j++;
  }
}

void* thread3() {
  while (i < N || q1_front < q1_back) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q1_front >= 0 && q1_front < n1 && q1_front < q1_back);
    total = total + q1[q1_front];
    q1_front++;
    __VERIFIER_atomic_end();
  }
}

void* thread4() {
  while (j < M || q2_front < q2_back) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q2_front >= 0 && q2_front < n2 && q2_front < q2_back);
    total = total + q2[q2_front];
    q2_front++;
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2, t3, t4;

  C = __VERIFIER_nondet_int();
  M = __VERIFIER_nondet_int();
  N = __VERIFIER_nondet_int();
  
  q1_front = __VERIFIER_nondet_int();
  q1_back  = __VERIFIER_nondet_int();
  q2_front = __VERIFIER_nondet_int();
  q2_back  = __VERIFIER_nondet_int();
  
  n1 = __VERIFIER_nondet_int();
  n2 = __VERIFIER_nondet_int();
  q1 = create_fresh_int_array(n1);
  q2 = create_fresh_int_array(n2);
  
  assume_abort_if_not(N > M && M >= 0 && C > 0 && q1_front == q1_back && q2_front == q2_back);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  pthread_join(t4, 0);
  
  assume_abort_if_not(total <= 0);
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