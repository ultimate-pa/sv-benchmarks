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
int front, back, sum, n;
_Bool v_assert;

int *create_fresh_int_array(int size);

void* thread1() {
  while (v_assert) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(back > front && front >= 0 && front < n);
    sum = sum + queue[front];
    front++;
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  _Bool b = 1;
  while (v_assert) {
    assume_abort_if_not(back >= 0 && back < n);
    if (b) {
      __VERIFIER_atomic_begin();
      assume_abort_if_not(queue[back] == 1);
      back++;
      __VERIFIER_atomic_end();
    } else {
      __VERIFIER_atomic_begin();
      assume_abort_if_not(queue[back] == -1);
      back++;
      __VERIFIER_atomic_end();
    }
    b = !b;
  }
}

void* thread3() {
  v_assert = (0 <= sum && sum <= 1);
}

void main() {
  pthread_t t1, t2, t3;
  
  n = __VERIFIER_nondet_int();
  front = __VERIFIER_nondet_int();
  back = front;
  v_assert = 1;
  queue = create_fresh_int_array(n);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
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