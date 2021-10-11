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
void reach_error() { __assert_fail("0", "chl-word-trans.wvr.c", 21, __extension__ __PRETTY_FUNCTION__); }
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

int *get1, *get2, *get3;
int count1, count2, count3, n1, n2, n3, res1, res2, res3;

int *create_fresh_int_array(int size);

void* thread1() {
  _Bool stop = 0;
  if (count1 == count2) {
    for (int i=0; i<n1 && i<n2; i++) {
      if (get1[i] != get2[i]) {
        res1 = get1[i] < get2[i] ? -1 : 1;
        stop = 1;
        break;
      }
    }
    if (!stop) {
      res1 = n1 - n2;
    }
  } else {
    res1 = count1 > count2 ? 1 : -1;
  }

  return 0;
}

void* thread2() {
  _Bool stop = 0;
  if (count2 == count3) {
    for (int i=0; i<n2 && i<n3; i++) {
      if (get2[i] != get3[i]) {
        res2 = get2[i] < get3[i] ? -1 : 1;
        stop = 1;
        break;
      }
    }
    if (!stop) {
      res2 = n2 - n3;
    }
  } else {
    res2 = count2 > count3 ? 1 : -1;
  }

  return 0;
}

void* thread3() {
  _Bool stop = 0;
  if (count1 == count3) {
    for (int i=0; i<n1 && i<n3; i++) {
      if (get1[i] != get3[i]) {
        res3 = get1[i] < get3[i] ? -1 : 1;
        stop = 1;
        break;
      }
    }
    if (!stop) {
      res3 = n1 - n3;
    }
  } else {
    res3 = count1 > count3 ? 1 : -1;
  }

  return 0;
}

int main() {
  pthread_t t1, t2, t3;
  
  count1 = __VERIFIER_nondet_int();
  count2 = __VERIFIER_nondet_int();
  count3 = __VERIFIER_nondet_int();
  n1 = __VERIFIER_nondet_int();
  n2 = __VERIFIER_nondet_int();
  n3 = __VERIFIER_nondet_int();
  get1 = create_fresh_int_array(n1);
  get2 = create_fresh_int_array(n2);
  get3 = create_fresh_int_array(n3);
  
  // main method
  pthread_create(&t1, 0, thread1, 0);
  pthread_create(&t2, 0, thread2, 0);
  pthread_create(&t3, 0, thread3, 0);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  assume_abort_if_not(res1 > 0 && res2 > 0 && res3 <= 0);
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