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

int* q;
int q_front, q_back, n, x, y, s, C, N;

int *create_fresh_int_array(int size);

void* thread1() {
  for (int i=0; i<N; i++) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q_back >= 0 && q_back < n);
    assume_abort_if_not(q[q_back] == 1);
    q_back++;
    __VERIFIER_atomic_end();
    x = x + C;
  }
  __VERIFIER_atomic_begin();
  assume_abort_if_not(q_back >= 0 && q_back < n);
  assume_abort_if_not(q[q_back] == 0);
  q_back++;
  __VERIFIER_atomic_end();
  x = x + C;
}

void* thread2() {
  int j;
  s = 0;
  while(1) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q_back > q_front && q_front >= 0 && q_front < n);
    j = q[q_front];
    q_front++;
    __VERIFIER_atomic_end();
    s = s + j;
    y = y + C;
    if (j == 0) {
      break;
    }
  }
}

void main() {
  pthread_t t1, t2;
  
  C = __VERIFIER_nondet_int();
  N = __VERIFIER_nondet_int();
  n = __VERIFIER_nondet_int();
  q_front = __VERIFIER_nondet_int();
  q_back = q_front;
  q = create_fresh_int_array(n);
  
  assume_abort_if_not(N >= 0);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  
  assume_abort_if_not(x != y || s != N);
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