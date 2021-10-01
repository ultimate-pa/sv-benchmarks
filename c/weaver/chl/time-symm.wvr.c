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

int ora_0, ora_2;
int volume_totale_1, volume_totale_3;
int cmp_4, cmp_5;

void* thread1() {
  __VERIFIER_atomic_begin();
  cmp_4 = ( ora_0 - ora_2 );
  cmp_4 = ( ( cmp_4 == 0 ) ? ( volume_totale_1 - volume_totale_3 ) : cmp_4 );
  __VERIFIER_atomic_end();
}

void* thread2() {
  __VERIFIER_atomic_begin();
  cmp_5 = ( ora_2 - ora_0 );
  cmp_5 = ( ( cmp_5 == 0 ) ? ( volume_totale_3 - volume_totale_1 ) : cmp_5 );
  __VERIFIER_atomic_end();
}


void main() {
  pthread_t t1, t2;

  // initialize global variables
  ora_0 = __VERIFIER_nondet_int();
  ora_2 = __VERIFIER_nondet_int();
  volume_totale_1 = __VERIFIER_nondet_int();
  volume_totale_3 = __VERIFIER_nondet_int();
  cmp_4 = __VERIFIER_nondet_int();
  cmp_5 = __VERIFIER_nondet_int();

  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not( !( ( ( cmp_4 < 0 ) ? ( - 1 ) : ( ( cmp_4 > 0 ) ? 1 : 0 ) ) == ( 0 - ( ( cmp_5 < 0 ) ? ( - 1 ) : ( ( cmp_5 > 0 ) ? 1 : 0 ) ) ) ) );
  reach_error();
}
