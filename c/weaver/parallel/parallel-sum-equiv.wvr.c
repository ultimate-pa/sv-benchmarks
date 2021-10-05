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
void reach_error() { __assert_fail("0", "parallel-sum-equiv.wvr.c", 21, __extension__ __PRETTY_FUNCTION__); }
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

int* X_0;
int n_1, s_2, i_3, t_4, t_5, s_6, i_7, t_8;

int *create_fresh_int_array(int size);

void* thread2() {
  while ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( i_3 < n_1 );
    i_3++;
    t_4 = X_0[i_3];
    __VERIFIER_atomic_end();
    s_2 = ( s_2 + t_4 );
  }
  assume_abort_if_not( !( i_3 < n_1 ) );

  return 0;
}

void* thread3() {
  while ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( i_3 < n_1 );
    i_3++;
    t_5 = X_0[i_3];
    __VERIFIER_atomic_end();
    s_2 = ( s_2 + t_5 );
  }
  assume_abort_if_not( !( i_3 < n_1 ) );

  return 0;
}

void* thread1() {
  pthread_t t2, t3;

  __VERIFIER_atomic_begin();  
  i_3 = 0;
  s_2 = 0;
  __VERIFIER_atomic_end();

  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  return 0;
}

void* thread4() {
  __VERIFIER_atomic_begin();
  i_7 = 0;
  s_6 = 0;
  __VERIFIER_atomic_end();

  while ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( i_7 < n_1 );
    i_7++;
    t_8 = X_0[i_7];
    __VERIFIER_atomic_end();
    s_6 = ( s_6 + t_8 );
  }
  assume_abort_if_not( !( i_7 < n_1 ) );

  return 0;
}

void* main() {
  pthread_t t1, t4;

  // initialize global variables
  n_1 = __VERIFIER_nondet_int();
  s_2 = __VERIFIER_nondet_int();
  i_3 = __VERIFIER_nondet_int();
  t_4 = __VERIFIER_nondet_int();
  t_5 = __VERIFIER_nondet_int();
  s_6 = __VERIFIER_nondet_int();
  i_7 = __VERIFIER_nondet_int();
  t_8 = __VERIFIER_nondet_int();
  X_0 = create_fresh_int_array(n_1 + 1);

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t4, 0);

  assume_abort_if_not( !( s_2 == s_6 ) );
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