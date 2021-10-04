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

int x_0, y_1;
_Bool f1_2, f2_3;
int temp_4, temp_5;
int x_6, x_7;
_Bool f1_8, f2_9;
int temp_10, temp_11;
int y_7;

void* thread2() {
  temp_4 = x_0;
  x_0 = temp_4 + 1;

  f1_2 = 1;
  assume_abort_if_not( f1_2 && f2_3 );

  temp_4 = y_1;
  y_1 = temp_4 + 1;

  return 0;
}

void* thread3() {
  temp_5 = y_1;
  y_1 = temp_5 + 1;

  f2_3 = 1;
  assume_abort_if_not( f1_2 && f2_3 );

  temp_5 = x_0;
  x_0 = temp_5 + 1;

  return 0;
}

void* thread1() {
  pthread_t t2, t3;

  assume_abort_if_not( x_0 == y_1 && !f1_2 && !f2_3 );

  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  return 0;
}

void* thread5() {
  temp_10 = x_6;
  x_6 = temp_10 + 1;

  f1_8 = 1;
  assume_abort_if_not( f1_8 && f2_9 );

  temp_10 = y_7;
  y_7 = temp_10 + 1;

  return 0;
}

void* thread6() {
  temp_11 = y_7;
  y_7 = temp_11 + 1;

  f2_9 = 1;
  assume_abort_if_not( f1_8 && f2_9 );

  temp_11 = x_6;
  x_6 = temp_11 + 1;

  return 0;
}

void* thread4() {
  pthread_t t5, t6;

  assume_abort_if_not( x_6 == y_7 && !f1_8 && !f2_9 );

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
  f1_2 = __VERIFIER_nondet_bool();
  f2_3 = __VERIFIER_nondet_bool();
  temp_4 = __VERIFIER_nondet_int();
  temp_5 = __VERIFIER_nondet_int();
  x_6 = __VERIFIER_nondet_int();
  x_7 = __VERIFIER_nondet_int();
  f1_8 = __VERIFIER_nondet_bool();
  f2_9 = __VERIFIER_nondet_bool();
  temp_10 = __VERIFIER_nondet_int();
  temp_11 = __VERIFIER_nondet_int();

  // main method
  assume_abort_if_not( ( x_0 == x_6 ) && ( y_1 == y_7 ) );

  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t4, 0);

  assume_abort_if_not( !( ( x_0 == x_6 ) && ( y_1 == y_7 ) ) );
  reach_error();
}
