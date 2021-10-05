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
void reach_error() { __assert_fail("0", "misc-4.wvr.c", 21, __extension__ __PRETTY_FUNCTION__); }
extern int pthread_create (pthread_t *__restrict __newthread,
      const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3)));
extern int pthread_join (pthread_t __th, void **__thread_return);

extern int   __VERIFIER_nondet_int(void);
extern _Bool __VERIFIER_nondet_bool(void);
extern void  __VERIFIER_atomic_begin();
extern void  __VERIFIER_atomic_end();

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int pos;
_Bool d1, d2, v_assert;

void* thread1() {
  while (v_assert) {
    if (d1) {
      __VERIFIER_atomic_begin();
      pos++;
      __VERIFIER_atomic_end();
    }
    else {
      __VERIFIER_atomic_begin();
      pos--;
      __VERIFIER_atomic_end();
    }
    d1 = !d1;
  }

  return 0;
}

void* thread2() {
  while (v_assert) {
    if (d2) {
      pos = ( pos + 2 );

    }
    else {
      pos = ( pos - 2 );

    }
    d2 = !d2;
  }

  return 0;
}

void* thread3() {
  v_assert = (pos >= 0);

  return 0;
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  pos = __VERIFIER_nondet_int();
  d1  = __VERIFIER_nondet_bool();
  d2  = __VERIFIER_nondet_bool();
  v_assert  = __VERIFIER_nondet_bool();

  // main method
  assume_abort_if_not( ( pos == 0 ) && ( d1 == d2 && d1 == 1 ) && ( v_assert == 1 ) );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  reach_error();
}