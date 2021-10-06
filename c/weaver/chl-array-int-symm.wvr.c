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
void reach_error() { __assert_fail("0", "array-int-symm.wvr.c", 21, __extension__ __PRETTY_FUNCTION__); }
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

int *a1, *a2;
int res1, res2, n1, n2;

int *create_fresh_int_array(int size);

void* thread1() {
  int i = 0;
  res1 = n1 - n2;
  while (i < n1 && i < n2) {
    if (a1[i] != a2[i]) {
      res1 = a1[i] - a2[i];
      break;
    }
    i++;
  }
}

void* thread2() {
  int i = 0;
  res2 = n2 - n1;
  while (i < n1 && i < n2) {
    if (a1[i] != a2[i]) {
      res2 = a2[i] - a1[i];
      break;
    }
    i++;
  }
}

int main() {
  pthread_t t1, t2;
  
  n1 = __VERIFIER_nondet_int();
  n2 = __VERIFIER_nondet_int();
  a1 = create_fresh_int_array(n1);
  a2 = create_fresh_int_array(n2);
  
  // main method
  pthread_create(&t1, 0, thread1, 0);
  pthread_create(&t2, 0, thread2, 0);
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