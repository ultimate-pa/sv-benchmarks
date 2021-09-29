#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int   __VERIFIER_nondet_int(void);
extern _Bool __VERIFIER_nondet_bool(void);

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int* A;
int bag1, bag2, cap1, cap2, sum1, sum2, i, j, N;

int *create_fresh_int_array(int size);

void* thread1() {
  while (( i < N )) {
    if (( ( bag1 + A[i] ) < cap1 )) {
      bag1 = ( bag1 + A[i] );

    }
    else {
      sum1 = ( sum1 + bag1 );
      bag1 = A[i];

    }
    i++;
  }
  sum1 = ( sum1 + bag1 );
  return 0;
}

void* thread2() {
  while (( j < N )) {
    if (( ( bag2 + A[j] ) < cap2 )) {
      bag2 = ( bag2 + A[j] );

    }
    else {
      sum2 = ( sum2 + bag2 );
      bag2 = A[j];

    }
    j++;
  }
  sum2 = ( sum2 + bag2 );
  return 0;
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  bag1 = __VERIFIER_nondet_int();
  bag2 = __VERIFIER_nondet_int();
  cap1 = __VERIFIER_nondet_int();
  cap2 = __VERIFIER_nondet_int();
  sum1 = __VERIFIER_nondet_int();
  sum2 = __VERIFIER_nondet_int();
  i    = __VERIFIER_nondet_int();
  j    = __VERIFIER_nondet_int();
  N    = __VERIFIER_nondet_int();
  A    = create_fresh_int_array(N);

  // main method
  assume_abort_if_not( bag1 == bag2 && bag1 == sum1 && bag1 == sum2 && bag1 == i && bag1 == j && bag1 == 0 );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not( sum1 != sum2 );
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
