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

int *a1, *a2;
int res1, res2;
_Bool isNull1, isNull2;

int *create_fresh_int_array(int size);

void* thread1() {
  int i = 0;
  assume_abort_if_not(!isNull1);
  while (!isNull2 && i < 5) {
    res1 = a1[i] - a2[i];
    if (res1 == 0) {
      break;
    }
    i++;
  }
}

void* thread2() {
  int i = 0;
  assume_abort_if_not(!isNull2);
  while (!isNull1 && i < 5) {
    res2 = a2[i] - a1[i];
    if (res2 == 0) {
      break;
    }
    i++;
  }
}

void main() {
  pthread_t t1, t2;
  
  a1 = create_fresh_int_array(5);
  a2 = create_fresh_int_array(5);
  isNull1 = __VERIFIER_nondet_bool();
  isNull2 = __VERIFIER_nondet_bool();
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(!(res1 < 0 && res2 > 0));
  assume_abort_if_not(!(res1 > 0 && res2 < 0));
  assume_abort_if_not(!(res1 == 0 && res2 == 0));
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