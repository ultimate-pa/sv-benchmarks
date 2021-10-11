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
void reach_error() { __assert_fail("0", "popl20-prod-cons.wvr.c", 21, __extension__ __PRETTY_FUNCTION__); }
extern int pthread_create (pthread_t *__restrict __newthread,
      const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3)));
extern int pthread_join (pthread_t __th, void **__thread_return);

typedef unsigned int size_t;
extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

extern int  __VERIFIER_nondet_int(void);
extern _Bool __VERIFIER_nondet_bool(void);
extern void __VERIFIER_atomic_begin(void);
extern void __VERIFIER_atomic_end(void);

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int* queue;
int front, back, d, n, W;
_Bool v_assert;

int *create_fresh_int_array(int size);

void* thread1() {
  for (int w=W; w>0; w--) {
    if (!v_assert) {
      break;
    }
    __VERIFIER_atomic_begin();
    assume_abort_if_not(back >= 0 && back < n);
    assume_abort_if_not(queue[back] == 1);
    back++;
    __VERIFIER_atomic_end();
  }

  return 0;
}

void* thread2() {
  int temp;
  while (v_assert) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(front < back && front >= 0 && front < n);
    temp = queue[front];
    front++;
    __VERIFIER_atomic_end();
    d = d + temp;
  }

  return 0;
}

void* thread3() {
  v_assert = (d <= W);

  return 0;
}

int main() {
  pthread_t t1, t2, t3;
  
  W = __VERIFIER_nondet_int();
  n = __VERIFIER_nondet_int();
  front = __VERIFIER_nondet_int();
  back = front;
  v_assert = 1;
  queue = create_fresh_int_array(n);
  
  assume_abort_if_not(W >= 0);
  
  // main method
  pthread_create(&t1, 0, thread1, 0);
  pthread_create(&t2, 0, thread2, 0);
  pthread_create(&t3, 0, thread3, 0);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  
  assume_abort_if_not(!v_assert);
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