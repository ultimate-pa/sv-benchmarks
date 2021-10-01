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

int sort_label_0, sort_label_2, result_4, result_5;
_Bool sort_label_is_null_1, sort_label_is_null_3;

void* thread1() {
  result_4 = !!sort_label_is_null_1 == !!sort_label_is_null_3 && (sort_label_is_null_1 || sort_label_is_null_3 || sort_label_0 == sort_label_2) ? 0 : (sort_label_is_null_1 ? -1 : (sort_label_is_null_3 ? 1 : sort_label_0 - sort_label_2));
}

void* thread2() {
  result_5 = !!sort_label_is_null_3 == !!sort_label_is_null_1 && (sort_label_is_null_3 || sort_label_is_null_1 || sort_label_2 == sort_label_0) ? 0 : (sort_label_is_null_3 ? -1 : (sort_label_is_null_1 ? 1 : sort_label_2 - sort_label_0));
}

void main() {
  pthread_t t1, t2;
  
  sort_label_0 = __VERIFIER_nondet_int();
  sort_label_2 = __VERIFIER_nondet_int();
  sort_label_is_null_1 = __VERIFIER_nondet_bool();
  sort_label_is_null_3 = __VERIFIER_nondet_bool();
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(!(result_4 < 0 && result_5 > 0));
  assume_abort_if_not(!(result_4 > 0 && result_5 < 0));
  assume_abort_if_not(!(result_4 == 0 && result_5 == 0));
  reach_error();
}