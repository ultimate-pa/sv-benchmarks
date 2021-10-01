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

int id_0, id_3, result_6, order1_7, order2_8, result_9, order1_10, order2_11;
int *get_2, *get_5;
_Bool *contains_key_1, *contains_key_4;

int *create_fresh_int_array(int size);
_Bool *create_fresh_bool_array(int size);

void* thread1() {
  __VERIFIER_atomic_begin();
  order1_7 = get_2[id_0];
  order2_8 = get_5[id_3];
  result_6 = ( ( contains_key_1[id_0] && contains_key_4[id_3] ) ? ( ( order1_7 < order2_8 ) ? ( 0 - 1 ) : ( ( order1_7 > order2_8 ) ? 1 : 0 ) ) : ( get_2[id_0] - get_5[id_3] ) );
  __VERIFIER_atomic_end();

  return 0;
}

void* thread2() {
  __VERIFIER_atomic_begin();
  order1_10 = get_5[id_3];
  order2_11 = get_2[id_0];
  result_9 = ( ( contains_key_4[id_3] && contains_key_1[id_0] ) ? ( ( order1_10 < order2_11 ) ? ( 0 - 1 ) : ( ( order1_10 > order2_11 ) ? 1 : 0 ) ) : ( get_5[id_3] - get_2[id_0] ) );
  __VERIFIER_atomic_end();

  return 0;
}


void main() {
  pthread_t t1, t2;

  // initialize global variables
  id_0 = __VERIFIER_nondet_int();
  id_3 = __VERIFIER_nondet_int();
  result_6 = __VERIFIER_nondet_int();
  order1_7 = __VERIFIER_nondet_int();
  order2_8 = __VERIFIER_nondet_int();
  result_9 = __VERIFIER_nondet_int();
  order1_10 = __VERIFIER_nondet_int();
  order2_11 = __VERIFIER_nondet_int();
  get_2 = create_fresh_int_array(id_0 + 1);
  get_5 = create_fresh_int_array(id_3 + 1);
  contains_key_1 = create_fresh_bool_array(id_0+1);
  contains_key_4 = create_fresh_bool_array(id_3+1);

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not( !( ( ( result_6 < 0 ) ? ( - 1 ) : ( ( result_6 > 0 ) ? 1 : 0 ) ) == ( 0 - ( ( result_9 < 0 ) ? ( - 1 ) : ( ( result_9 > 0 ) ? 1 : 0 ) ) ) ) );
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
