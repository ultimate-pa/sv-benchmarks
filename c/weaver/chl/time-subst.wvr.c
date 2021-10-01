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

int ora_0, ora_2, ora_4;
int volume_totale_1, volume_totale_3, volume_totale_5;
int cmp_6, cmp_7, cmp_8;

void* thread1() {
  __VERIFIER_atomic_begin();
  cmp_6 = ( ora_0 - ora_2 );
  cmp_6 = ( ( cmp_6 == 0 ) ? ( volume_totale_1 - volume_totale_3 ) : cmp_6 );
  __VERIFIER_atomic_end();
}

void* thread2() {
  __VERIFIER_atomic_begin();
  cmp_7 = ( ora_0 - ora_4 );
  cmp_7 = ( ( cmp_7 == 0 ) ? ( volume_totale_1 - volume_totale_5 ) : cmp_7 );
  __VERIFIER_atomic_end();
}

void* thread3() {
  __VERIFIER_atomic_begin();
  cmp_8 = ( ora_2 - ora_4 );
  cmp_8 = ( ( cmp_8 == 0 ) ? ( volume_totale_3 - volume_totale_5 ) : cmp_8 );
  __VERIFIER_atomic_end();
}

void main() {
  pthread_t t1, t2, t3;

  // initialize global variables
  ora_0 = __VERIFIER_nondet_int();
  ora_2 = __VERIFIER_nondet_int();
  ora_4 = __VERIFIER_nondet_int();
  volume_totale_1 = __VERIFIER_nondet_int();
  volume_totale_3 = __VERIFIER_nondet_int();
  volume_totale_5 = __VERIFIER_nondet_int();
  cmp_6 = __VERIFIER_nondet_int();
  cmp_7 = __VERIFIER_nondet_int();
  cmp_8 = __VERIFIER_nondet_int();

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);

  assume_abort_if_not( !( !( cmp_6 == 0 ) || ( ( ( cmp_7 > 0 ) == ( cmp_8 > 0 ) ) && ( ( cmp_7 < 0 ) == ( cmp_8 < 0 ) ) ) ) );
  reach_error();
}
