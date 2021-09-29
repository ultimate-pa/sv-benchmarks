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

int* q1;
int* q2;
int* q3;
int q1_front, q1_back, q2_front, q2_back, q3_front, q3_back, N, r, n1, n2, n3;

int *create_fresh_int_array(int size);

void* thread1() {
  int i = 0;
  int l;
  r = 0;
  while (i < N) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q1_back >= 0 && q1_back < n1 && q1[q1_back] == 2);
    q1_back++;
    __VERIFIER_atomic_end();
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q3_back > q3_front && q3_front >= 0 && q3_front < n3);
	l = q3[q3_front];
    q3_front++;
    __VERIFIER_atomic_end();
    r = r + l;
    i++;
  }
  __VERIFIER_atomic_begin();
  assume_abort_if_not(q1_back >= 0 && q1_back < n1 && q1[q1_back] == 0);
  q1_back++;
  __VERIFIER_atomic_end();
}

void* thread2() {
  int s = 0;
  int j;
  while (1) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q1_back > q1_front && q1_front >= 0 && q1_front < n1);
    j = q1[q1_front];
    q1_front++;
    __VERIFIER_atomic_end();
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q2_back >= 0 && q2_back < n2 && q2[q2_back] == j-1);
    q2_back++;
    __VERIFIER_atomic_end();
    s = s + j;
    if (j <= 0) {
      break;
    }
  }
}

void* thread3() {
  int t = 0;
  int k;
  while (1) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q2_back > q2_front && q2_front >= 0 && q2_front < n2);
    k = q2[q2_front];
    q2_front++;
    __VERIFIER_atomic_end();
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q3_back >= 0 && q3_back < n3 && q3[q3_back] == k-1);
    q3_back++;
    __VERIFIER_atomic_end();
    t = t + k;
    if (k <= 0) {
      break;
    }
  }
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  N = __VERIFIER_nondet_int();
  
  n1 = __VERIFIER_nondet_int();
  n2 = __VERIFIER_nondet_int();
  n3 = __VERIFIER_nondet_int();
  
  q1 = create_fresh_int_array(n1);
  q2 = create_fresh_int_array(n2);
  q3 = create_fresh_int_array(n3);
  
  q1_front = __VERIFIER_nondet_int();
  q2_front = __VERIFIER_nondet_int();
  q3_front = __VERIFIER_nondet_int();
  
  q1_back = q1_front;
  q2_back = q2_front;
  q3_back = q3_front;
  
  assume_abort_if_not(N >= 0);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
  assume_abort_if_not(r != 0);
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