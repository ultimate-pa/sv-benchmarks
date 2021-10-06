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
void reach_error() { __assert_fail("0", "unroll-cond-2.wvr.c", 21, __extension__ __PRETTY_FUNCTION__); }
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

int *f;
int i1, x1, i2, x2, n, size;

int *create_fresh_int_array(int size);


void* thread1() {
  while (i1 < n) {
    __VERIFIER_atomic_begin();
    x1 = f[x1];
    assume_abort_if_not(x1 >= 0 && x1 < size);
    i1++;
    __VERIFIER_atomic_end();
  }
  return 0;
}

void* thread2() {
  while (i2 < n - 1) {
    __VERIFIER_atomic_begin();
    x2 = f[x2];
    assume_abort_if_not(x2 >= 0 && x2 < size);
    i2++;
    x2 = f[x2];
    assume_abort_if_not(x2 >= 0 && x2 < size);
    i2++;
    __VERIFIER_atomic_end();
  }
  if (i2 < n) {
    x2 = f[x2];
    assume_abort_if_not(x2 >= 0 && x2 < size);
    i2++;
  }
  return 0;
}

int main() {
  pthread_t t1, t2;

  // initialize global variables
  n = __VERIFIER_nondet_int();
  size = __VERIFIER_nondet_int();
  f = create_fresh_int_array(size);

  // main method
  pthread_create(&t1, 0, thread1, 0);
  pthread_create(&t2, 0, thread2, 0);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(x1 != x2);
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