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

int id_0, id_3, id_6, result_9, order1_10, order2_11, result_12, order1_13, order2_14, result_15, order1_16, order2_17;
int *get_2, *get_5, *get_8;
_Bool *contains_key_1, *contains_key_4, *contains_key_7;

int *create_fresh_int_array(int size);
_Bool *create_fresh_bool_array(int size);

void* thread1() {
  __VERIFIER_atomic_begin();
  order1_10 = get_2[id_0];
  order2_11 = get_5[id_3];
  result_9 = ( ( contains_key_1[id_0] && contains_key_4[id_3] ) ? ( ( order1_10 < order2_11 ) ? ( 0 - 1 ) : ( ( order1_10 > order2_11 ) ? 1 : 0 ) ) : ( get_2[id_0] - get_5[id_3] ) );
  __VERIFIER_atomic_end();

  return 0;
}

void* thread2() {
  __VERIFIER_atomic_begin();
  order1_13 = get_2[id_0];
  order2_14 = get_8[id_6];
  result_12 = ( ( contains_key_1[id_0] && contains_key_7[id_6] ) ? ( ( order1_13 < order2_14 ) ? ( 0 - 1 ) : ( ( order1_13 > order2_14 ) ? 1 : 0 ) ) : ( get_2[id_0] - get_8[id_6] ) );
  __VERIFIER_atomic_end();

  return 0;
}

void* thread3() {
  __VERIFIER_atomic_begin();
  order1_16 = get_5[id_3];
  order2_17 = get_8[id_6];
  result_15 = ( ( contains_key_4[id_3] && contains_key_7[id_6] ) ? ( ( order1_16 < order2_17 ) ? ( 0 - 1 ) : ( ( order1_16 > order2_17 ) ? 1 : 0 ) ) : ( get_5[id_3] - get_8[id_6] ) );
  __VERIFIER_atomic_end();

  return 0;
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  id_0 = __VERIFIER_nondet_int();
  id_3 = __VERIFIER_nondet_int();
  id_6 = __VERIFIER_nondet_int();
  result_9 = __VERIFIER_nondet_int();
  order1_10 = __VERIFIER_nondet_int();
  order2_11 = __VERIFIER_nondet_int();
  result_12 = __VERIFIER_nondet_int();
  order1_13 = __VERIFIER_nondet_int();
  order2_14 = __VERIFIER_nondet_int();
  result_15 = __VERIFIER_nondet_int();
  order1_16 = __VERIFIER_nondet_int();
  order2_17 = __VERIFIER_nondet_int();
  get_2 = create_fresh_int_array(id_0 + 1);
  get_5 = create_fresh_int_array(id_3 + 1);
  get_8 = create_fresh_int_array(id_6 + 1);
  contains_key_1 = create_fresh_bool_array(id_0+1);
  contains_key_4 = create_fresh_bool_array(id_3+1);
  contains_key_7 = create_fresh_bool_array(id_6+1);

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  assume_abort_if_not( !( !( result_9 == 0 ) || ( ( ( result_12 > 0 ) == ( result_15 > 0 ) ) && ( ( result_12 < 0 ) == ( result_15 < 0 ) ) ) ) );
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

_Bool *create_fresh_bool_array(int size) {
  assume_abort_if_not(size >= 0);

  _Bool* arr = (_Bool*)malloc(sizeof(_Bool) * size);
  for (int i = 0; i < size; i++) {
    arr[i] = __VERIFIER_nondet_bool();
  }
  return arr;
}
