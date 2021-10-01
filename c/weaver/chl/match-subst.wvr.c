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

int score_0, seq_1_start_1, seq_2_start_2, score_3, seq_1_start_4, seq_2_start_5, score_6, seq_1_start_7, seq_2_start_8, result_9, result_10, result_11;

void* thread1() {
  result_9 = score_0 > score_3 ? -1 : (score_0 < score_3 ? 1 : (seq_1_start_1 + seq_2_start_2 < seq_1_start_4 + seq_2_start_5 ? -1 : (seq_1_start_1 + seq_2_start_2 > seq_1_start_4 + seq_2_start_5 ? 1 : 0)));
}

void* thread2() {
  result_10 = score_0 > score_6 ? -1 : (score_0 < score_6 ? 1 : (seq_1_start_1 + seq_2_start_2 < seq_1_start_7 + seq_2_start_8 ? -1 : (seq_1_start_1 + seq_2_start_2 > seq_1_start_7 + seq_2_start_8 ? 1 : 0)));
}

void* thread3() {
  result_11 = score_3 > score_6 ? -1 : (score_3 < score_6 ? 1 : (seq_1_start_4 + seq_2_start_5 < seq_1_start_7 + seq_2_start_8 ? -1 : (seq_1_start_4 + seq_2_start_5 > seq_1_start_7 + seq_2_start_8 ? 1 : 0)));
}

void main() {
  pthread_t t1, t2, t3;
  
  score_0 = __VERIFIER_nondet_int();
  seq_1_start_1 = __VERIFIER_nondet_int();
  seq_2_start_2 = __VERIFIER_nondet_int();
  score_3 = __VERIFIER_nondet_int();
  seq_1_start_4 =__VERIFIER_nondet_int();
  seq_2_start_5 = __VERIFIER_nondet_int();
  score_6 = __VERIFIER_nondet_int();
  seq_1_start_7 =__VERIFIER_nondet_int();
  seq_2_start_8 = __VERIFIER_nondet_int();
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  assume_abort_if_not(result_9 == 0);
  assume_abort_if_not((result_10 > 0) != (result_11 > 0) || (result_10 < 0) != (result_11 < 0));
  reach_error();
}