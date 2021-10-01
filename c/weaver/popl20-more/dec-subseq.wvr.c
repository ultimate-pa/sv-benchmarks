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

int *queue, *A;
int i, N, n, last, start, end, new, v_old;
_Bool ok;

int *create_fresh_int_array(int size);

void* thread1() {
  while (i < N) {
    if (A[i] <= last) {
      __VERIFIER_atomic_begin();
      assume_abort_if_not(end >= 0 && end < n);
      assume_abort_if_not(queue[end] == A[i]);
      end++;
      __VERIFIER_atomic_end();
      last = A[i];
    }
    __VERIFIER_atomic_begin();
    i++;
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  while (i < N || start < end) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(start < end && start >= 0 && start < n);
    new = queue[start];
    start++;
    __VERIFIER_atomic_end();
    ok = ok && (v_old >= new);
    v_old = new;
  }
}

void main() {
  pthread_t t1, t2;
  
  ok = 1;
  N = __VERIFIER_nondet_int();
  n = __VERIFIER_nondet_int();
  start = __VERIFIER_nondet_int();
  end = start;
  queue = create_fresh_int_array(n);
  A = create_fresh_int_array(N);
  
  assume_abort_if_not(N > 0);
  v_old = A[0];
  last = v_old;
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  
  assume_abort_if_not(!ok);
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