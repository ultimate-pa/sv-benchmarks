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
void reach_error() { __assert_fail("0", "min-max-1.wvr.c", 21, __extension__ __PRETTY_FUNCTION__); }
extern int pthread_create (pthread_t *__restrict __newthread,
      const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3)));
extern int pthread_join (pthread_t __th, void **__thread_return);

typedef unsigned int size_t;
extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

extern int   __VERIFIER_nondet_int(void);
extern _Bool __VERIFIER_nondet_bool(void);
extern void  __VERIFIER_atomic_begin();
extern void  __VERIFIER_atomic_end();

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int* A;
int min, max, i, j, N;
_Bool v_assert, b1, b2;

int *create_fresh_int_array(int size);

void* thread1() {
  min = A[0];
  b1 = 1;
  while (( ( 0 < i ) && ( i < N ) )) {
    min = ( min < A[i] ) ? min : A[i];
    i = ( i + 1 );
  }

  return 0;
}

void* thread2() {
  max = A[0];
  b2 = 1;
  while (( ( 0 < j ) && ( j < N ) )) {
    max = ( max > A[j] ) ? max : A[j];
    j = ( j + 1 );
  }

  return 0;
}

void* thread3() {
  v_assert = ( !b1 || !b2  || ( min <= max ) );

  return 0;
}

int main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  min = __VERIFIER_nondet_int();
  max = __VERIFIER_nondet_int();
  i   = __VERIFIER_nondet_int();
  j   = __VERIFIER_nondet_int();
  N   = __VERIFIER_nondet_int();
  b1 = __VERIFIER_nondet_bool();
  b2 = __VERIFIER_nondet_bool();
  v_assert = __VERIFIER_nondet_bool();
  A = create_fresh_int_array(N);

  // main method
  assume_abort_if_not( ( i == j && i == 0 ) && ( min == max && min == A[0] ) && ( v_assert == b1 && v_assert == b2 && v_assert == 0 ) );

  pthread_create(&t1, 0, thread1, 0);
  pthread_create(&t2, 0, thread2, 0);
  pthread_create(&t3, 0, thread3, 0);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  assume_abort_if_not( !v_assert );
  reach_error();

  return 0;
}

int *create_fresh_int_array(int size) {
  assume_abort_if_not(size >= 0);

  int* arr = (int*)malloc(sizeof(int) * size);
  for (int i = 0; i < size; i++) {
    arr[i] = __VERIFIER_nondet_int();
  }
  return arr;
}