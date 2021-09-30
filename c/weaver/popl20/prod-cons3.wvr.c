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

int *queue1, *queue2;
int front1, back1, front2, back2, d1, d2, n1, n2, W;
_Bool v_assert;

int *create_fresh_int_array(int size);

void* thread1() {
  for (int w=W; w>0; w--) {
    if (!v_assert) {
      break;
    }
    __VERIFIER_atomic_begin();
    assume_abort_if_not(back1 >= 0 && back1 < n1);
    assume_abort_if_not(queue1[back1] == 1);
    back1++;
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  int temp;
  while (v_assert) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(front1 < back1 && front1 >= 0 && front1 < n1);
    temp = queue1[front1];
    front1++;
    __VERIFIER_atomic_end();
    __VERIFIER_atomic_begin();
    assume_abort_if_not(back2 >= 0 && back2 < n2);
    assume_abort_if_not(queue2[back2] == temp + 1);
    back2++;
    __VERIFIER_atomic_end();
    d1 = d1 + temp;
  }
}

void* thread3() {
  int temp;
  while (v_assert) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(front2 < back2 && front2 >= 0 && front2 < n2);
    temp = queue2[front2];
    front2++;
    __VERIFIER_atomic_end();
    d2 = d2 + temp;
  }
}

void* thread4() {
  v_assert = (d2 <= 2*W);
}

void main() {
  pthread_t t1, t2, t3, t4;
  
  W = __VERIFIER_nondet_int();
  n1 = __VERIFIER_nondet_int();
  n2 = __VERIFIER_nondet_int();
  front1 = __VERIFIER_nondet_int();
  front2 = __VERIFIER_nondet_int();
  back1 = front1;
  back2 = front2;
  v_assert = 1;
  queue1 = create_fresh_int_array(n1);
  queue2 = create_fresh_int_array(n2);
  
  assume_abort_if_not(W >= 0);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  pthread_join(t4, 0);
  
  assume_abort_if_not(!v_assert);
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