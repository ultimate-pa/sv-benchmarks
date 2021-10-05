// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 F. Schuessele <schuessf@informatik.uni-freiburg.de>
// SPDX-FileCopyrightText: 2021 D. Klumpp <klumpp@informatik.uni-freiburg.de>
//
// SPDX-License-Identifier: BSD-3-Clause

typedef unsigned long int pthread_t;

union pthread_attr_t
{
  char __size[36];
  long int __align;
};
typedef union pthread_attr_t pthread_attr_t;

extern void __assert_fail(const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "dot-product-alt.wvr.c", 21, __extension__ __PRETTY_FUNCTION__); }
extern int pthread_create (pthread_t *__restrict __newthread,
      const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3)));
extern int pthread_join (pthread_t __th, void **__thread_return);

extern int  __VERIFIER_nondet_int(void);
extern _Bool __VERIFIER_nondet_bool(void);
extern void __VERIFIER_atomic_begin(void);
extern void __VERIFIER_atomic_end(void);

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int* A;
int* B;
int** mult;
int M, N, maxA, maxB, res1, res2;

int *create_fresh_int_array(int size);

void* thread1() {
  for (int i=0; i<N; i++) {
    assume_abort_if_not(0 <= A[i] && A[i] < maxA && 0 <= B[i] && B[i] < maxB);
    res1 = res1 + mult[A[i]][B[i]];
  }
}

void* thread2() {
  for (int i=0; i<M; i++) {
    assume_abort_if_not(0 <= A[i] && A[i] < maxA && 0 <= B[i] && B[i] < maxB);
    res2 = res2 + mult[A[i]][B[i]];
  }
}

void* thread3() {
  for (int i=M; i<N; i++) {
    assume_abort_if_not(0 <= A[i] && A[i] < maxA && 0 <= B[i] && B[i] < maxB);
    res2 = res2 + mult[A[i]][B[i]];
  }
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  M = __VERIFIER_nondet_int();
  N = __VERIFIER_nondet_int();
  A = create_fresh_int_array(N);
  B = create_fresh_int_array(N);
  
  maxA = __VERIFIER_nondet_int();
  maxB = __VERIFIER_nondet_int();
  mult = (int**)malloc(sizeof(int*) * maxA);
  for (int i=0; i<maxA; i++) {
    mult[i] = create_fresh_int_array(maxB);
  }
  
  assume_abort_if_not(M >= 0 && N > M);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
  assume_abort_if_not(res1 != res2);
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