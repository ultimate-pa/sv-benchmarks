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

int filename_0, get_subject_3, filename_4, get_subject_7, result_8, i_9, result_11, i_12;
_Bool is_null_1, is_null_5, break_10, break_13;
_Bool *ends_with_2, *ends_with_6;

_Bool *create_fresh_bool_array(int size);

void* thread1() {
  if ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( !is_null_1 && !is_null_5 );
    i_9 = 0;
    break_10 = 0;
    __VERIFIER_atomic_end();
 
    while ( __VERIFIER_nondet_bool() ) {
      __VERIFIER_atomic_begin();
      assume_abort_if_not( ( i_9 < 5 ) && !break_10 );
      result_8 = ( ( ends_with_2[i_9] && ends_with_6[i_9] ) ? 0 : result_8 );
      break_10 = ( ( ends_with_2[i_9] && ends_with_6[i_9] ) ? 1 : break_10 );
      result_8 = ( ( !break_10 && ends_with_2[i_9] ) ? ( ( 0 - 1000 ) + i_9 ) : result_8 );
      break_10 = ( ( !break_10 && ends_with_2[i_9] ) ? 1 : break_10 );
      result_8 = ( ( !break_10 && ends_with_6[i_9] ) ? ( 1000 + i_9 ) : result_8 );
      break_10 = ( ( !break_10 && ends_with_6[i_9] ) ? 1 : break_10 );
      i_9++;
      __VERIFIER_atomic_end();
    }

    __VERIFIER_atomic_begin();
    assume_abort_if_not( !( ( i_9 < 5 ) && !break_10 ) );
    result_8 = ( (!break_10) ? ( filename_0 - filename_4 ) : result_8 );
    __VERIFIER_atomic_end();
  }
  else {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( !( !is_null_1 && !is_null_5 ) );
    result_8 = ( ( !is_null_1 && is_null_5 ) ? ( 0 - 995 ) : ( ( is_null_1 && !is_null_5 ) ? 1005 : ( get_subject_3 - get_subject_7 ) ) );
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  if ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( !is_null_5 && !is_null_1 );
    i_12 = 0;
    break_13 = 0;
    __VERIFIER_atomic_end();

    while ( __VERIFIER_nondet_bool() ) {
      __VERIFIER_atomic_begin();
      assume_abort_if_not( ( i_12 < 5 ) && !break_13 );
      result_11 = ( ( ends_with_6[i_12] && ends_with_2[i_12] ) ? 0 : result_11 );
      break_13  = ( ( ends_with_6[i_12] && ends_with_2[i_12] ) ? 1 : break_13 );
      result_11 = ( ( !break_13 && ends_with_6[i_12] ) ? ( ( 0 - 1000 ) + i_12 ) : result_11 );
      break_13  = ( ( !break_13 && ends_with_6[i_12] ) ? 1 : break_13 );
      result_11 = ( ( !break_13 && ends_with_2[i_12] ) ? ( 1000 + i_12 ) : result_11 );
      break_13  = ( ( !break_13 && ends_with_2[i_12] ) ? 1 : break_13 );
      i_12++;
      __VERIFIER_atomic_end();
    }
  
    __VERIFIER_atomic_begin();
    assume_abort_if_not( !( ( i_12 < 5 ) && !break_13 ) );
    result_11 = ( (!break_13) ? ( filename_4 - filename_0 ) : result_11 );
    __VERIFIER_atomic_end();
  }
  else {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( !( !is_null_5 && !is_null_1 ) );
    result_11 = ( ( !is_null_5 && is_null_1 ) ? ( 0 - 995 ) : ( ( is_null_5 && !is_null_1 ) ? 1005 : ( get_subject_7 - get_subject_3 ) ) );
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2;

  // initialize global variables
  filename_0 = __VERIFIER_nondet_int();
  get_subject_3 = __VERIFIER_nondet_int();
  filename_4 = __VERIFIER_nondet_int();
  get_subject_7 = __VERIFIER_nondet_int();
  result_8 = __VERIFIER_nondet_int();
  i_9 = __VERIFIER_nondet_int();
  result_11 = __VERIFIER_nondet_int();
  i_12 = __VERIFIER_nondet_int();
  is_null_1 = __VERIFIER_nondet_bool();
  is_null_5 = __VERIFIER_nondet_bool();
  break_10 = __VERIFIER_nondet_bool();
  break_13 = __VERIFIER_nondet_bool();
  ends_with_2  = create_fresh_bool_array(5);
  ends_with_6  = create_fresh_bool_array(5);

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not( !( ( ( result_8 < 0 ) ? ( - 1 ) : ( ( result_8 > 0 ) ? 1 : 0 ) ) == ( 0 - ( ( result_11 < 0 ) ? ( - 1 ) : ( ( result_11 > 0 ) ? 1 : 0 ) ) ) ) );
  reach_error();
}

_Bool *create_fresh_bool_array(int size) {
  assume_abort_if_not(size >= 0);

  _Bool* arr = (_Bool*)malloc(sizeof(_Bool) * size);
  for (int i = 0; i < size; i++) {
    arr[i] = __VERIFIER_nondet_bool();
  }
  return arr;
}
