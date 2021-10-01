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

int *queue;
int A, B, n, start, end;
_Bool ok;

int *create_fresh_int_array(int size);

void* thread1() {
  int x = 0;
  for (int i=0; i<A; i++) {
    x = x + B;
  }
  __VERIFIER_atomic_begin();
  assume_abort_if_not(end >= 0 && end < n);
  assume_abort_if_not(queue[end] == x);
  end++;
  __VERIFIER_atomic_end();
}

void* thread2() {
  int x = 0;
  for (int i=0; i<A; i++) {
    x = x + B;
  }
  __VERIFIER_atomic_begin();
  assume_abort_if_not(end >= 0 && end < n);
  assume_abort_if_not(queue[end] == x);
  end++;
  __VERIFIER_atomic_end();
}

void* thread3() {
  assume_abort_if_not(end == start + 2 && start >= 0 && start < n-1);
  ok = (queue[start] == queue[start+1]);
}

void main() {
  pthread_t t1, t2, t3;
  
  A = __VERIFIER_nondet_int();
  B = __VERIFIER_nondet_int();
  n = __VERIFIER_nondet_int();
  start = __VERIFIER_nondet_int();
  end = start;
  queue = create_fresh_int_array(n);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
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