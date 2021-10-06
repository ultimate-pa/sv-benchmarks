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
void reach_error() { __assert_fail("0", "buffer-mult.wvr.c", 21, __extension__ __PRETTY_FUNCTION__); }
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

int *q1, *q2;
int q1_front, q1_back, q2_front, q2_back, i, j, n1, n2, N, C, total;

int *create_fresh_int_array(int size);

void* thread1() {
  while (i < N) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q1_back >= 0 && q1_back < n1);
    assume_abort_if_not(q1[q1_back] == C);
    q1_back++;
    __VERIFIER_atomic_end();
    __VERIFIER_atomic_begin();
    i++;
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  while (j < N) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q2_back >= 0 && q2_back < n2);
    assume_abort_if_not(q2[q2_back] == -C);
    q2_back++;
    __VERIFIER_atomic_end();
    __VERIFIER_atomic_begin();
    j++;
    __VERIFIER_atomic_end();
  }
}

void* thread3() {
  while (i < N || q1_front < q1_back) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q1_front < q1_back && q1_front >= 0 && q1_front < n1);
    total = total + q1[q1_front];
    q1_front++;
    __VERIFIER_atomic_end();
  }
}

void* thread4() {
  while (j < N || q2_front < q2_back) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(q2_front < q2_back && q2_front >= 0 && q2_front < n2);
    total = total + q2[q2_front];
    q2_front++;
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2, t3, t4;
  
  C = __VERIFIER_nondet_int();
  N = __VERIFIER_nondet_int();
  n1 = __VERIFIER_nondet_int();
  n2 = __VERIFIER_nondet_int();
  q1_front = __VERIFIER_nondet_int();
  q1_back = q1_front;
  q2_front = __VERIFIER_nondet_int();
  q2_back = q2_front;
  q1 = create_fresh_int_array(n1);
  q2 = create_fresh_int_array(n2);
  
  assume_abort_if_not(N >= 0);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  pthread_join(t4, 0);
  
  assume_abort_if_not(total != 0);
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