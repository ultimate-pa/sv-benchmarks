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

int cardSet_0, cardRarity_1, cardId_2, cardType_3, cardSet_4, cardRarity_5, cardId_6, cardType_7, result_8, result_9;

void* thread1() {
  __VERIFIER_atomic_begin();
  result_8 = cardSet_0 - cardSet_4;
  result_8 = result_8 == 0 ? cardRarity_1 - cardRarity_5 : result_8;
  result_8 = result_8 == 0 ? cardId_2 - cardId_6 : result_8;
  result_8 = result_8 == 0 ? cardType_3 - cardType_7 : result_8;
  __VERIFIER_atomic_end();
}

void* thread2() {
  __VERIFIER_atomic_begin();
  result_9 = cardSet_4 - cardSet_0;
  result_9 = result_9 == 0 ? cardRarity_5 - cardRarity_1 : result_9;
  result_9 = result_9 == 0 ? cardId_6 - cardId_2 : result_9;
  result_9 = result_9 == 0 ? cardType_7 - cardType_3 : result_9;
  __VERIFIER_atomic_end();
}

void main() {
  pthread_t t1, t2;
  
  cardSet_0 = __VERIFIER_nondet_int();
  cardRarity_1 = __VERIFIER_nondet_int();
  cardId_2 = __VERIFIER_nondet_int();
  cardType_3 = __VERIFIER_nondet_int();
  cardSet_4 = __VERIFIER_nondet_int();
  cardRarity_5 = __VERIFIER_nondet_int();
  cardId_6 = __VERIFIER_nondet_int();
  cardType_7 = __VERIFIER_nondet_int();
  result_8 = __VERIFIER_nondet_int();
  result_9 = __VERIFIER_nondet_int();
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(!(result_8 < 0 && result_9 > 0));
  assume_abort_if_not(!(result_8 > 0 && result_9 < 0));
  assume_abort_if_not(!(result_8 == 0 && result_9 == 0));
  reach_error();
}