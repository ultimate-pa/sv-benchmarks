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
void reach_error() { __assert_fail("0", "bluetooth.wvr.c", 21, __extension__ __PRETTY_FUNCTION__); }
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

int count, pos;
_Bool sFlag, sEvent, stopped, v_assert;

void* thread1() {
  __VERIFIER_atomic_begin();
  count = sFlag ? count : (count + 1);
  v_assert = ( sFlag || !stopped );
  __VERIFIER_atomic_end();

  count--;
  if (( count == 0 )) {
    sEvent = 1;
  }

  return 0;
}

void* thread2() {
  sFlag = 1;
  count--;
  if (( count == 0 )) {
    sEvent = 1;

  }
  assume_abort_if_not(sEvent);
  stopped = 1;

  return 0;
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  count = __VERIFIER_nondet_int();
  pos   = __VERIFIER_nondet_int();
  sFlag = __VERIFIER_nondet_bool();
  sEvent = __VERIFIER_nondet_bool();
  stopped = __VERIFIER_nondet_bool();
  v_assert = __VERIFIER_nondet_bool();

  // main method
  assume_abort_if_not( pos == 0 );
  assume_abort_if_not( count == 1 );
  assume_abort_if_not( sFlag == 0 );
  assume_abort_if_not( sEvent == 0 );
  assume_abort_if_not( stopped == 0 );
  assume_abort_if_not( v_assert == 1 );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not( !v_assert );
  reach_error();
}