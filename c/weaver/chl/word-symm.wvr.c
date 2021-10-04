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

int *get1, *get2;
int count1, count2, n1, n2, res1, res2;

int *create_fresh_int_array(int size);

void* thread1() {
  _Bool stop = 0;
  if (count1 == count2) {
    for (int i=0; i<n1 && i<n2; i++) {
      if (get1[i] != get2[i]) {
        res1 = get1[i] < get2[i] ? -1 : 1;
        stop = 1;
        break;
      }
    }
    if (!stop) {
      res1 = n1 - n2;
    }
  } else {
    res1 = count1 > count2 ? 1 : -1;
  }
}

void* thread2() {
  _Bool stop = 0;
  if (count2 == count1) {
    for (int i=0; i<n2 && i<n1; i++) {
      if (get2[i] != get1[i]) {
        res2 = get2[i] < get1[i] ? -1 : 1;
        stop = 1;
        break;
      }
    }
    if (!stop) {
      res2 = n2 - n1;
    }
  } else {
    res2 = count2 > count1 ? 1 : -1;
  }
}

void main() {
  pthread_t t1, t2;
  
  count1 = __VERIFIER_nondet_int();
  count2 = __VERIFIER_nondet_int();
  n1 = __VERIFIER_nondet_int();
  n2 = __VERIFIER_nondet_int();
  get1 = create_fresh_int_array(n1);
  get2 = create_fresh_int_array(n2);
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);

  assume_abort_if_not(!(res1 < 0 && res2 > 0));
  assume_abort_if_not(!(res1 > 0 && res2 < 0));
  assume_abort_if_not(!(res1 == 0 && res2 == 0));
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