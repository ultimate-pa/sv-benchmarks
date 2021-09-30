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

int* queue;
int front, back, element, sum, n;

int *create_fresh_int_array(int size);

void* thread1() {
  while (back > front) {
    assume_abort_if_not(front >= 0 && front < n);
	element = queue[front];
    front++;
    sum = sum + element;
  }
}

void* thread2() {
  _Bool flag = 1;
  while (__VERIFIER_nondet_bool()) {
	assume_abort_if_not(back >= 0 && back < n);
    if (flag) {
      assume_abort_if_not(queue[back] == 1);
      back++;
    } else {
      assume_abort_if_not(queue[back] == -1);
      back++;
    }
    flag = !flag;
  }
}

void main() {
  pthread_t t1, t2;
  
  front = __VERIFIER_nondet_int();
  back = front;
  n = __VERIFIER_nondet_int();
  queue = create_fresh_int_array(n);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  
  assume_abort_if_not(sum < 0 || sum > 1);
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