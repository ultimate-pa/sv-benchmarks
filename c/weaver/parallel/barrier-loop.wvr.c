#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int   __VERIFIER_nondet_int(void);
extern _Bool __VERIFIER_nondet_bool(void);
extern void  __VERIFIER_atomic_begin();
extern void  __VERIFIER_atomic_end();

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int x_0, y_1, x_8, y_9;
_Bool f1_2, f2_3, f1_10, f2_11;
int temp_4, temp_5, temp_6, temp_7, temp_12, temp_13, temp_14, temp_15;


void* thread2() {
  while ( __VERIFIER_nondet_bool() ) {
    temp_4 = x_0;
    x_0 = temp_4 + 1;

    f1_2 = 1;
    assume_abort_if_not(f2_3);

    temp_5 = y_1;
    y_1 = temp_5 + 1;

    f1_2 = 0;
    assume_abort_if_not(!f2_3);
  }

  return 0;
}

void* thread3() {
  while ( __VERIFIER_nondet_bool() ) {
    temp_6 = y_1;
    y_1 = temp_6 + 1;

    f2_3 = 1;
    assume_abort_if_not(f1_2);

    temp_7 = x_0;
    x_0 = temp_7 + 1;

    f2_3 = 0;
    assume_abort_if_not(!f1_2);
  }

  return 0;
}

void* thread1() {
  pthread_t t2, t3;

  __VERIFIER_atomic_begin();
  f1_2 = 0;
  f2_3 = 0;
  __VERIFIER_atomic_end();

  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  return 0;
}

void* thread5() {
  while ( __VERIFIER_nondet_bool() ) {
    temp_12 = x_8;
    x_8 = temp_12 + 1;
 
    f1_10 = 1;
    assume_abort_if_not(f2_11);

    temp_13 = y_9;
    y_9 = temp_13 + 1;

    f1_10 = 0;
    assume_abort_if_not(!f2_11);
  }

  return 0;
}

void* thread6() {
  while ( __VERIFIER_nondet_bool() ) {
    temp_14 = y_9;
    y_9 = temp_14 + 1;

    f2_11 = 1;
    assume_abort_if_not(f1_10);

    temp_15 = x_8;
    x_8 = temp_15 + 1;

    f2_11 = 0;
    assume_abort_if_not(!f1_10);
  }

  return 0;
}

void* thread4() {
  pthread_t t5, t6;

  __VERIFIER_atomic_begin();
  f1_10 = 0;
  f2_11 = 0;
  __VERIFIER_atomic_end();

  pthread_create(&t5, NULL, thread5, NULL);
  pthread_create(&t6, NULL, thread6, NULL);
  pthread_join(t5, 0);
  pthread_join(t6, 0);

  return 0;
}

void main() {
  pthread_t t1, t4;

  // initialize global variables
  x_0 = __VERIFIER_nondet_int();
  y_1 = __VERIFIER_nondet_int();
  x_8 = __VERIFIER_nondet_int();
  y_9 = __VERIFIER_nondet_int();
  temp_4  = __VERIFIER_nondet_int();
  temp_5  = __VERIFIER_nondet_int();
  temp_6  = __VERIFIER_nondet_int();
  temp_7  = __VERIFIER_nondet_int();
  temp_12 = __VERIFIER_nondet_int();
  temp_13 = __VERIFIER_nondet_int();
  temp_14 = __VERIFIER_nondet_int();
  temp_15 = __VERIFIER_nondet_int();
  f1_2  = __VERIFIER_nondet_bool();
  f2_3  = __VERIFIER_nondet_bool();
  f1_10 = __VERIFIER_nondet_bool();
  f2_11 = __VERIFIER_nondet_bool();

  // main method
  assume_abort_if_not( ( x_0 == x_8 ) && ( y_1 == y_9 ) );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t4, 0);

  assume_abort_if_not( !( ( x_0 == x_8 ) && ( y_1 == y_9 ) ) );
  reach_error();
}
