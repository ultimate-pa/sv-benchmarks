#include <pthread.h>
typedef unsigned long int pthread_t;

#include <assert.h>
void reach_error() { assert(0); }

extern int  __VERIFIER_nondet_int(void);
extern _Bool __VERIFIER_nondet_bool(void);
extern void __VERIFIER_atomic_begin(void);
extern void __VERIFIER_atomic_end(void);

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

int *index_of_0, *char_at_1, *count_occurrences_of_2, *last_index_of_3, *index_of_4, *char_at_5, *count_occurrences_of_6, *last_index_of_7;
int result_8, i1_9, i2_11, result_13, i1_14, i2_16;
_Bool break_10, break_12, break_15, break_17;

int *create_fresh_int_array(int size);

void* thread1() {
  if (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not ( ( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) ) && ( index_of_0[4] == index_of_4[4] ) );
    i1_9 = 0;
    break_10 = 0;
    __VERIFIER_atomic_end();
    while (__VERIFIER_nondet_bool()) {
      __VERIFIER_atomic_begin();
      assume_abort_if_not ( !break_10 && ( i1_9 <= 12 ) );
      result_8 = ( ( ( char_at_1[i1_9] != 0 ) && ( ( char_at_1[i1_9] != 4 ) && ( ( char_at_5[i1_9] != 0 ) && ( char_at_5[i1_9] != 4 ) ) ) ) ? 0 : ( ( ( char_at_1[i1_9] != 0 ) && ( char_at_1[i1_9] != 4 ) ) ? ( 0 - 1 ) : ( ( ( char_at_5[i1_9] != 0 ) && ( char_at_5[i1_9] != 4 ) ) ? 1 : result_8 ) ) );
      break_10 = ( ( ( ( char_at_1[i1_9] != 0 ) && ( char_at_1[i1_9] != 4 ) ) || ( ( char_at_5[i1_9] != 0 ) && ( char_at_5[i1_9] != 4 ) ) ) ? 1 : break_10 );
      i1_9 = ( i1_9 + 1 );
      __VERIFIER_atomic_end();
    }
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( !break_10 && ( i1_9 <= 12 ) ));
    result_8 = ( !break_10 ? ( index_of_0[4] - index_of_4[4] ) : result_8 );
    __VERIFIER_atomic_end();
  }
  else if (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not ( ( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) ) && !( index_of_0[4] == index_of_4[4] ) );
    result_8 = ( index_of_0[4] - index_of_4[4] );
    __VERIFIER_atomic_end();
  }
  else if (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) ));
    assume_abort_if_not ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
    assume_abort_if_not ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
    assume_abort_if_not ( last_index_of_3[3] == last_index_of_7[3] );
    i2_11 = 0;
    break_12 = 0;
    __VERIFIER_atomic_end();
    while (__VERIFIER_nondet_bool()) {
      __VERIFIER_atomic_begin();
      assume_abort_if_not ( !break_12 && ( i2_11 <= 12 ) );
      result_8 = ( ( ( i2_11 != last_index_of_3[3] ) && ( ( ( char_at_1[i2_11] == 2 ) || ( char_at_1[i2_11] == 3 ) ) && ( ( char_at_5[i2_11] == 2 ) || ( char_at_5[i2_11] == 3 ) ) ) ) ? 0 : ( ( ( i2_11 != last_index_of_3[3] ) && ( ( char_at_1[i2_11] == 2 ) || ( char_at_1[i2_11] == 3 ) ) ) ? ( 0 - 1 ) : ( ( ( i2_11 != last_index_of_3[3] ) && ( ( char_at_5[i2_11] == 2 ) || ( char_at_5[i2_11] == 3 ) ) ) ? 1 : result_8 ) ) );
      break_12 = ( ( ( i2_11 != last_index_of_3[3] ) && ( ( char_at_1[i2_11] == 2 ) || ( ( char_at_1[i2_11] == 3 ) || ( ( char_at_5[i2_11] == 2 ) || ( char_at_5[i2_11] == 3 ) ) ) ) ) ? 1 : break_12 );
      __VERIFIER_atomic_end();
    }
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( !break_12 && ( i2_11 <= 12 ) ));
    result_8 = ( !break_12 ? ( last_index_of_3[3] - last_index_of_7[3] ) : result_8 );
    __VERIFIER_atomic_end();
  }
  else if (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) ));
    assume_abort_if_not ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
    assume_abort_if_not ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
    assume_abort_if_not(!( last_index_of_3[3] == last_index_of_7[3] ));
    result_8 = ( last_index_of_3[3] - last_index_of_7[3] );
    __VERIFIER_atomic_end();
  }
  else if (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) ));
    assume_abort_if_not ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
    assume_abort_if_not(!( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) ));
    result_8 = 1;
    __VERIFIER_atomic_end();
  }
  else if (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) ));
    assume_abort_if_not(!( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) ));
    assume_abort_if_not ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
    result_8 = ( 0 - 1 );
    __VERIFIER_atomic_end();
  }
  else {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) ));
    assume_abort_if_not(!( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) ));
    assume_abort_if_not(!( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) ));
    result_8 = 0;
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  if (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not ( ( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) ) && ( index_of_4[4] == index_of_0[4] ) );
    i1_14 = 0;
    break_15 = 0;
    __VERIFIER_atomic_end();
    while (__VERIFIER_nondet_bool()) {
      __VERIFIER_atomic_begin();
      assume_abort_if_not ( !break_15 && ( i1_14 <= 12 ) );
      result_13 = ( ( ( char_at_5[i1_14] != 0 ) && ( ( char_at_5[i1_14] != 4 ) && ( ( char_at_1[i1_14] != 0 ) && ( char_at_1[i1_14] != 4 ) ) ) ) ? 0 : ( ( ( char_at_5[i1_14] != 0 ) && ( char_at_5[i1_14] != 4 ) ) ? ( 0 - 1 ) : ( ( ( char_at_1[i1_14] != 0 ) && ( char_at_1[i1_14] != 4 ) ) ? 1 : result_13 ) ) );
      break_15 = ( ( ( ( char_at_5[i1_14] != 0 ) && ( char_at_5[i1_14] != 4 ) ) || ( ( char_at_1[i1_14] != 0 ) && ( char_at_1[i1_14] != 4 ) ) ) ? 1 : break_15 );
      i1_14 = ( i1_14 + 1 );
      __VERIFIER_atomic_end();
    }
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( !break_15 && ( i1_14 <= 12 ) ));
    result_13 = ( !break_15 ? ( index_of_4[4] - index_of_0[4] ) : result_13 );
    __VERIFIER_atomic_end();
  }
  else if (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not ( ( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) ) && !( index_of_4[4] == index_of_0[4] ) );
    result_13 = ( index_of_4[4] - index_of_0[4] );
    __VERIFIER_atomic_end();
  }
  else if (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) ));
    assume_abort_if_not ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
    assume_abort_if_not ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
    assume_abort_if_not ( last_index_of_7[3] == last_index_of_3[3] );
    i2_16 = 0;
    break_17 = 0;
    __VERIFIER_atomic_end();
    while (__VERIFIER_nondet_bool()) {
      __VERIFIER_atomic_begin();
      assume_abort_if_not ( !break_17 && ( i2_16 <= 12 ) );
      result_13 = ( ( ( i2_16 != last_index_of_7[3] ) && ( ( ( char_at_5[i2_16] == 2 ) || ( char_at_5[i2_16] == 3 ) ) && ( ( char_at_1[i2_16] == 2 ) || ( char_at_1[i2_16] == 3 ) ) ) ) ? 0 : ( ( ( i2_16 != last_index_of_7[3] ) && ( ( char_at_5[i2_16] == 2 ) || ( char_at_5[i2_16] == 3 ) ) ) ? ( 0 - 1 ) : ( ( ( i2_16 != last_index_of_7[3] ) && ( ( char_at_1[i2_16] == 2 ) || ( char_at_1[i2_16] == 3 ) ) ) ? 1 : result_13 ) ) );
      break_17 = ( ( ( i2_16 != last_index_of_7[3] ) && ( ( char_at_5[i2_16] == 2 ) || ( ( char_at_5[i2_16] == 3 ) || ( ( char_at_1[i2_16] == 2 ) || ( char_at_1[i2_16] == 3 ) ) ) ) ) ? 1 : break_17 );
      __VERIFIER_atomic_end();
    }
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( !break_17 && ( i2_16 <= 12 ) ));
    result_13 = ( !break_17 ? ( last_index_of_7[3] - last_index_of_3[3] ) : result_13 );
    __VERIFIER_atomic_end();
  }
  else if (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) ));
    assume_abort_if_not ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
    assume_abort_if_not ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
    assume_abort_if_not(!( last_index_of_7[3] == last_index_of_3[3] ));
    result_13 = ( last_index_of_7[3] - last_index_of_3[3] );
    __VERIFIER_atomic_end();
  }
  else if (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) ));
    assume_abort_if_not ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
    assume_abort_if_not(!( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) ));
    result_13 = 1;
    __VERIFIER_atomic_end();
  }
  else if (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) ));
    assume_abort_if_not(!( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) ));
    assume_abort_if_not ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
    result_13 = ( 0 - 1 );
    __VERIFIER_atomic_end();
  }
  else {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(!( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) ));
    assume_abort_if_not(!( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) ));
    assume_abort_if_not(!( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) ));
    result_13 = 0;
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2;
  
  index_of_0 = create_fresh_int_array(5);
  index_of_4 = create_fresh_int_array(5);
  count_occurrences_of_2 = create_fresh_int_array(4);
  count_occurrences_of_6 = create_fresh_int_array(4);
  last_index_of_3 = create_fresh_int_array(4);
  last_index_of_7 = create_fresh_int_array(4);
  char_at_1 = create_fresh_int_array(13);
  char_at_5 = create_fresh_int_array(13);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  
  assume_abort_if_not(!( ( ( result_8 < 0 ) ? -1 : ( ( result_8 > 0 ) ? 1 : 0 ) ) == ( 0 - ( ( result_13 < 0 ) ? -1 : ( ( result_13 > 0 ) ? 1 : 0 ) ) ) ));
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