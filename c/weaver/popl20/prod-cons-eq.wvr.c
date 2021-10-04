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

int *produce, *update, *queue1, **consume;
_Bool *done;
int front1, size1, state11, state12, state21, state22;
int n_queue, n_produce, n_update, n1, n2;
_Bool finished1, finished2;

int *create_fresh_int_array(int size);
_Bool *create_fresh_bool_array(int size);

void* thread1() {
  while (!finished1) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(front1+size1 >= 0 && front1+size1 < n_queue);
    assume_abort_if_not(state11 >= 0 && state11 < n_produce);
    assume_abort_if_not(queue1[front1+size1] == produce[state11]);
    size1++;
    __VERIFIER_atomic_end();
    assume_abort_if_not(state11 >= 0 && state11 < n_update);
    state11 = update[state11];
    finished1 = done[state11];
  }
}

void* thread2() {
  while (!finished1 || size1 > 0) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(size1 > 0);
    assume_abort_if_not(state12 >= 0 && state12 < n1);
    assume_abort_if_not(front1 >= 0 && front1 < n_queue);
    assume_abort_if_not(queue1[front1] >= 0 && queue1[front1] < n2);
    state12 = consume[state12][queue1[front1]];
    front1++;
    size1--;
    __VERIFIER_atomic_end();
  }
}

void* thread3() {
  while (!finished2) {
    assume_abort_if_not(state22 >= 0 && state22 < n1);
    assume_abort_if_not(state21 >= 0 && state21 < n_produce);
    assume_abort_if_not(produce[state21] >= 0 && produce[state21] < n2);
    state22 = consume[state22][produce[state21]];
    assume_abort_if_not(state21 >= 0 && state21 < n_update);
    state21 = update[state21];
    finished2 = done[state21];
  }
}

void main() {
  pthread_t t1, t2, t3;
  
  front1 = __VERIFIER_nondet_int();
  state11 = __VERIFIER_nondet_int();
  state21 = state11;
  state12 = __VERIFIER_nondet_int();
  state22 = state12;
  
  n_queue = __VERIFIER_nondet_int();
  n_produce = __VERIFIER_nondet_int();
  n_update = __VERIFIER_nondet_int();
  n1 = __VERIFIER_nondet_int();
  n2 = __VERIFIER_nondet_int();

  produce = create_fresh_int_array(n_produce);
  update = create_fresh_int_array(n_update);
  queue1 = create_fresh_int_array(n_queue);
  done = create_fresh_bool_array(n_update);
  consume = (int**)malloc(sizeof(int*) * n1);
  for (int i=0; i<n1; i++) {
    consume[i] = create_fresh_int_array(n2);
  }
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
  assume_abort_if_not(state12 != state22);
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

_Bool *create_fresh_bool_array(int size) {
  assume_abort_if_not(size >= 0);

  _Bool* arr = (int*)malloc(sizeof(_Bool) * size);
  for (int i = 0; i < size; i++) {
    arr[i] = __VERIFIER_nondet_bool();
  }
  return arr;
}