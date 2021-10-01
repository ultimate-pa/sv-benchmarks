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

int filename_0, get_subject_3, filename_4, get_subject_7, filename_8, get_subject_11, result_12, i_13, result_15, i_16, result_18, i_19;
_Bool is_null_1, is_null_5, is_null_9, break_14, break_17, break_20;
_Bool *ends_with_2, *ends_with_6, *ends_with_10;

_Bool *create_fresh_bool_array(int size);

void* thread1() {
  if ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( !is_null_1 && !is_null_5 );
    i_13 = 0;
    break_14 = 0;
    __VERIFIER_atomic_end();
 
    while ( __VERIFIER_nondet_bool() ) {
      __VERIFIER_atomic_begin();
      assume_abort_if_not( ( i_13 < 5 ) && !break_14 );
      result_12 = ( ( ends_with_2[i_13] && ends_with_6[i_13] ) ? 0 : result_12 );
      break_14  = ( ( ends_with_2[i_13] && ends_with_6[i_13] ) ? 1 : break_14 );
      result_12 = ( ( !break_14 && ends_with_2[i_13] ) ? ( ( 0 - 1000 ) + i_13 ) : result_12 );
      break_14  = ( ( !break_14 && ends_with_2[i_13] ) ? true : break_14 );
      result_12 = ( ( !break_14 && ends_with_6[i_13] ) ? ( 1000 + i_13 ) : result_12 );
      break_14  = ( ( !break_14 && ends_with_6[i_13] ) ? true : break_14 );
      i_13++;
      __VERIFIER_atomic_end();
    }

    __VERIFIER_atomic_begin();
    assume_abort_if_not( !( ( i_13 < 5 ) && !break_14 ) );
    result_12 = ( (!break_14) ? ( filename_0 - filename_4 ) : result_12 );
    __VERIFIER_atomic_end();
  }
  else {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( !( !is_null_1 && !is_null_5 ) );
    result_12 = ( ( !is_null_1 && is_null_5 ) ? ( 0 - 995 ) : ( ( is_null_1 && !is_null_5 ) ? 1005 : ( get_subject_3 - get_subject_7 ) ) );
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  if ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( !is_null_1 && !is_null_9 );
    i_16 = 0;
    break_17 = 0;
    __VERIFIER_atomic_end();

    while ( __VERIFIER_nondet_bool() ) {
      __VERIFIER_atomic_begin();
      assume_abort_if_not( ( i_16 < 5 ) && !break_17 );
      result_15 = ( ( ends_with_2[i_16] && ends_with_10[i_16] ) ? 0 : result_15 );
      break_17  = ( ( ends_with_2[i_16] && ends_with_10[i_16] ) ? true : break_17 );
      result_15 = ( ( !break_17 && ends_with_2[i_16] ) ? ( ( 0 - 1000 ) + i_16 ) : result_15 );
      break_17  = ( ( !break_17 && ends_with_2[i_16] ) ? true : break_17 );
      result_15 = ( ( !break_17 && ends_with_10[i_16] ) ? ( 1000 + i_16 ) : result_15 );
      break_17  = ( ( !break_17 && ends_with_10[i_16] ) ? true : break_17 );
      i_16++;
      __VERIFIER_atomic_end();
    }
  
    __VERIFIER_atomic_begin();
    assume_abort_if_not( !( ( i_16 < 5 ) && !break_17 ) );
    result_15 = ( (!break_17) ? ( filename_0 - filename_8 ) : result_15 );
    __VERIFIER_atomic_end();
  }
  else {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( !( !is_null_1 && !is_null_9 ) );
    result_15 = ( ( !is_null_1 && is_null_9 ) ? ( 0 - 995 ) : ( ( is_null_1 && !is_null_9 ) ? 1005 : ( get_subject_3 - get_subject_11 ) ) );
    __VERIFIER_atomic_end();
  }
}

void* thread3() {
  if ( __VERIFIER_nondet_bool() ) {
    __VERIFIER_atomic_begin();
      assume_abort_if_not( !is_null_5 && !is_null_9 );
      i_19 = 0;
      break_20 = 0;
    __VERIFIER_atomic_end();

    while ( __VERIFIER_nondet_bool() ) {
      __VERIFIER_atomic_begin();
      assume_abort_if_not( ( i_19 < 5 ) && !break_20 );
      result_18 = ( ( ends_with_6[i_19] && ends_with_10[i_19] ) ? 0 : result_18 );
      break_20  = ( ( ends_with_6[i_19] && ends_with_10[i_19] ) ? 1 : break_20 );
      result_18 = ( ( !break_20 && ends_with_6[i_19] ) ? ( ( 0 - 1000 ) + i_19 ) : result_18 );
      break_20  = ( ( !break_20 && ends_with_6[i_19] ) ? 1 : break_20 );
      result_18 = ( ( !break_20 && ends_with_10[i_19] ) ? ( 1000 + i_19 ) : result_18 );
      break_20  = ( ( !break_20 && ends_with_10[i_19] ) ? 1 : break_20 );
      i_19++;
      __VERIFIER_atomic_end();
    }

    __VERIFIER_atomic_begin();
    assume_abort_if_not( !( ( i_19 < 5 ) && !break_20 ) );
    result_18 = ( (!break_20) ? ( filename_4 - filename_8 ) : result_18 );
    __VERIFIER_atomic_end();
  }
  else {
    __VERIFIER_atomic_begin();
    assume_abort_if_not( !( !is_null_5 && !is_null_9 ) );
    result_18 = ( ( !is_null_5 && is_null_9 ) ? ( 0 - 995 ) : ( ( is_null_5 && !is_null_9 ) ? 1005 : ( get_subject_7 - get_subject_11 ) ) );
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  filename_0 = __VERIFIER_nondet_int();
  get_subject_3 = __VERIFIER_nondet_int();
  filename_4 = __VERIFIER_nondet_int();
  get_subject_7 = __VERIFIER_nondet_int();
  filename_8 = __VERIFIER_nondet_int();
  get_subject_11 = __VERIFIER_nondet_int();
  result_12 = __VERIFIER_nondet_int();
  i_13 = __VERIFIER_nondet_int();
  result_15 = __VERIFIER_nondet_int();
  i_16 = __VERIFIER_nondet_int();
  result_18 = __VERIFIER_nondet_int();
  i_19 = __VERIFIER_nondet_int();
  is_null_1 = __VERIFIER_nondet_bool();
  is_null_5 = __VERIFIER_nondet_bool();
  is_null_9 = __VERIFIER_nondet_bool();
  break_14 = __VERIFIER_nondet_bool();
  break_17 = __VERIFIER_nondet_bool();
  break_20 = __VERIFIER_nondet_bool();
  ends_with_2  = create_fresh_bool_array(5);
  ends_with_6  = create_fresh_bool_array(5);
  ends_with_10 = create_fresh_bool_array(5);

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  assume_abort_if_not( !( !( result_12 == 0 ) || ( ( ( result_15 > 0 ) == ( result_18 > 0 ) ) && ( ( result_15 < 0 ) == ( result_18 < 0 ) ) ) ) );
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
