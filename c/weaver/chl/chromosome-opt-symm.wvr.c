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

int *scoreA, *scoreB;
int res1, res2, isNullA, isNullB;

int *create_fresh_int_array(int size);

void* thread1() {
  int i = 0;
  int comp;
  assume_abort_if_not(isNullA != 0);
  while (isNullB != 0 && i < 5) {
    comp = scoreA[i] < scoreB[i] ? -1 : (scoreA[i] > scoreB[i] ? 1 : 0);
    if (comp != 0) {
      res1 = comp;
      break;
    }
    i++;
  }
}

void* thread2() {
  int i = 0;
  int comp;
  assume_abort_if_not(isNullB != 0);
  while (isNullA != 0 && i < 5) {
    comp = scoreB[i] < scoreA[i] ? -1 : (scoreB[i] > scoreA[i] ? 1 : 0);
    if (comp != 0) {
      res2 = comp;
      break;
    }
    i++;
  }
}

void main() {
  pthread_t t1, t2;
  
  scoreA = create_fresh_int_array(5);
  scoreB = create_fresh_int_array(5);
  isNullA = __VERIFIER_nondet_int();
  isNullB = __VERIFIER_nondet_int();
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(res1 != -res2);
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