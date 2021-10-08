// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 F. Schuessele <schuessf@informatik.uni-freiburg.de>
// SPDX-FileCopyrightText: 2021 D. Klumpp <klumpp@informatik.uni-freiburg.de>
//
// SPDX-License-Identifier: LicenseRef-BSD-3-Clause-Attribution-Vandikas

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
void reach_error() { __assert_fail("0", "buffer-mult-alt.wvr.c", 21, __extension__ __PRETTY_FUNCTION__); }
extern int pthread_create (pthread_t *__restrict __newthread,
      const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3)));
extern int pthread_join (pthread_t __th, void **__thread_return);

typedef unsigned int size_t;
extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

extern int  __VERIFIER_nondet_int(void);
extern void __VERIFIER_atomic_begin(void);
extern void __VERIFIER_atomic_end(void);

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int* q1;
int* q2;
int i, j, total, C, N, M, q1_front, q1_back, q2_front, q2_back, n1, n2;

int *create_fresh_int_array(int size);
int plus(int a, int b);

void* thread1() {
  while (i < N) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q1_back >= 0 && q1_back < n1 && q1[q1_back] == C);
    assume_abort_if_not(q1_back < 2147483647);
    q1_back++;
    __VERIFIER_atomic_end();
    i++;
  }

  return 0;
}

void* thread2() {
  while (j < M) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q2_back >= 0 && q2_back < n2 && q2[q2_back] == -C);
    assume_abort_if_not(q2_back < 2147483647);
    q2_back++;
    __VERIFIER_atomic_end();
    j++;
  }

  return 0;
}

void* thread3() {
  while (i < N || q1_front < q1_back) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q1_front >= 0 && q1_front < n1 && q1_front < q1_back);
    total = plus(total, q1[q1_front]);
    q1_front++;
    __VERIFIER_atomic_end();
  }

  return 0;
}

void* thread4() {
  while (j < M || q2_front < q2_back) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q2_front >= 0 && q2_front < n2 && q2_front < q2_back);
    total = plus(total, q2[q2_front]);
    q2_front++;
    __VERIFIER_atomic_end();
  }

  return 0;
}

int main() {
  pthread_t t1, t2, t3, t4;

  C = __VERIFIER_nondet_int();
  M = __VERIFIER_nondet_int();
  N = __VERIFIER_nondet_int();
  
  q1_front = __VERIFIER_nondet_int();
  q1_back  = __VERIFIER_nondet_int();
  q2_front = __VERIFIER_nondet_int();
  q2_back  = __VERIFIER_nondet_int();
  
  n1 = __VERIFIER_nondet_int();
  n2 = __VERIFIER_nondet_int();
  q1 = create_fresh_int_array(n1);
  q2 = create_fresh_int_array(n2);
  
  assume_abort_if_not(N > M && M >= 0 && C > 0 && q1_front == q1_back && q2_front == q2_back);
  
  // main method
  pthread_create(&t1, 0, thread1, 0);
  pthread_create(&t2, 0, thread2, 0);
  pthread_create(&t3, 0, thread3, 0);
  pthread_create(&t4, 0, thread4, 0);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  pthread_join(t4, 0);
  
  assume_abort_if_not(total <= 0);
  reach_error();

  return 0;
}

int *create_fresh_int_array(int size) {
  assume_abort_if_not(size >= 0);
  assume_abort_if_not(size <= (((size_t) 4294967295) / sizeof(int)));

  int* arr = (int*)malloc(sizeof(int) * (size_t)size);
  for (int i = 0; i < size; i++) {
    arr[i] = __VERIFIER_nondet_int();
  }
  return arr;
}

int plus(int a, int b) {
  assume_abort_if_not(b >= 0 || a >= -2147483648 - b);
  assume_abort_if_not(b <= 0 || a <= 2147483647 - b);
  return a + b;
}