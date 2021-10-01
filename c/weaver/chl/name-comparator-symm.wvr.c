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

int* nondet_0;
int name_1, name_2, result_3, i_4, current_5, break_6, result_7, i_8, current_9, break_10;

int *create_fresh_int_array(int size);

void* thread1() {
  __VERIFIER_atomic_begin();
  i_4 = 0;
  break_6 = 0;
  result_3 = ( name_1 == name_2 ) ? 0 : result_3;
  break_6 = ( name_1 == name_2 ) ? 1 : break_6;
  __VERIFIER_atomic_end();

  while ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( ( i_4 < 3 ) && !break_6 );
    current_5 = nondet_0[i_4];
    result_3 = ( current_5 == name_1 ) ? 1 : result_3;
    break_6  = ( current_5 == name_1 ) ? 1 : break_6;
    result_3 = ( !break_6 && ( current_5 == name_2 ) ) ? ( 0 - 1 ) : result_3;
    break_6  = ( !break_6 && ( current_5 == name_2 ) ) ? 1 : break_6;
    i_4++;
    __VERIFIER_atomic_end();
  }
  __VERIFIER_atomic_begin();
  assume_abort_if_not( !( ( i_4 < 3 ) && !break_6 ) );
  result_3 = ( !break_6 ) ? ( name_1 - name_2 ) : result_3;
  __VERIFIER_atomic_end();

  return 0;
}

void* thread2() {
  __VERIFIER_atomic_begin();
  i_8 = 0;
  break_10 = 0;
  result_7 = ( name_2 == name_1 ) ? 0 : result_7;
  break_10 = ( name_2 == name_1 ) ? 1 : break_10;
  __VERIFIER_atomic_end();

  while ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( ( i_8 < 3 ) && !break_10 );
    current_9 = nondet_0[i_8];
    result_7 = ( current_9 == name_2 ) ? 1 : result_7;
    break_10 = ( current_9 == name_2 ) ? 1 : break_10;
    result_7 = ( !break_10 && ( current_9 == name_1 ) ) ? ( 0 - 1 ) : result_7;
    break_10 = ( !break_10 && ( current_9 == name_1 ) ) ? 1 : break_10;
    i_8++;
    __VERIFIER_atomic_end();
  }

  __VERIFIER_atomic_begin();
  assume_abort_if_not( !( ( i_8 < 3 ) && !break_10 ) );
  result_7 = (!break_10) ? ( name_2 - name_1 ) : result_7;
  __VERIFIER_atomic_end();

  return 0;
}

void main() {
  pthread_t t1, t2, t3;

int* nondet_0;
int ult_7, i_8, current_9, break_10;

  // initialize global variables
  name_1 = __VERIFIER_nondet_int();
  name_2 = __VERIFIER_nondet_int();
  result_3 = __VERIFIER_nondet_int();
  i_4 = __VERIFIER_nondet_int();
  current_5 = __VERIFIER_nondet_int();
  break_6 = __VERIFIER_nondet_int();
  result_7 = __VERIFIER_nondet_int();
  i_8 = __VERIFIER_nondet_int();
  current_9 = __VERIFIER_nondet_int();
  break_10 = __VERIFIER_nondet_int();
  nondet_0 = create_fresh_int_array(3);

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not( !( ( ( result_3 < 0 ) ? ( - 1 ) : ( ( result_3 > 0 ) ? 1 : 0 ) ) == ( 0 - ( ( result_7 < 0 ) ? ( - 1 ) : ( ( result_7 > 0 ) ? 1 : 0 ) ) ) ) );
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
