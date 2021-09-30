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

int *manager, *client, *node1, *node2;
int client_size, client_front, client_back;
int manager_size, manager_front, manager_back;
int node1_size, node1_front, node1_back;
int node2_size, node2_front, node2_back;
int update, ok;
_Bool safe;

int *create_fresh_int_array(int size);

void* thread1() {
  while (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(manager_back > manager_front && manager_front >= 0 && manager_front < manager_size);
    safe = safe && manager[manager_front] == update;
    manager_front++;
    __VERIFIER_atomic_end();

    __VERIFIER_atomic_begin();
    assume_abort_if_not(node1_back >= 0 && node1_back < node1_size);
    assume_abort_if_not(node1[node1_back] == update);
    node1_back++;
    __VERIFIER_atomic_end();

    __VERIFIER_atomic_begin();
    assume_abort_if_not(node2_back >= 0 && node2_back < node2_size);
    assume_abort_if_not(node2[node2_back] == update);
    node2_back++;
    __VERIFIER_atomic_end();

    __VERIFIER_atomic_begin();
    assume_abort_if_not(manager_back > manager_front && manager_front >= 0 && manager_front < manager_size);
    safe = safe && manager[manager_front] == ok;
    manager_front++;
    __VERIFIER_atomic_end();

    __VERIFIER_atomic_begin();
    assume_abort_if_not(manager_back > manager_front && manager_front >= 0 && manager_front < manager_size);
    safe = safe && manager[manager_front] == ok;
    manager_front++;
    __VERIFIER_atomic_end();

    __VERIFIER_atomic_begin();
    assume_abort_if_not(client_back >= 0 && client_back < client_size);
    assume_abort_if_not(client[client_back] == ok);
    client_back++;
    __VERIFIER_atomic_end();
  }
}

void* thread2() {
  while (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(node1_back > node1_front && node1_front >= 0 && node1_front < node1_size);
    safe = safe && node1[node1_front] == update;
    node1_front++;
    __VERIFIER_atomic_end();

    __VERIFIER_atomic_begin();
    assume_abort_if_not(manager_back >= 0 && manager_back < manager_size);
    assume_abort_if_not(manager[manager_back] == ok);
    manager_back++;
    __VERIFIER_atomic_end();
  }
}

void* thread3() {
  while (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(node2_back > node2_front && node2_front >= 0 && node2_front < node2_size);
    safe = safe && node2[node2_front] == update;
    node2_front++;
    __VERIFIER_atomic_end();

    __VERIFIER_atomic_begin();
    assume_abort_if_not(manager_back >= 0 && manager_back < manager_size);
    assume_abort_if_not(manager[manager_back] == ok);
    manager_back++;
    __VERIFIER_atomic_end();
  }
}

void* thread4() {
  while (__VERIFIER_nondet_bool()) {
    __VERIFIER_atomic_begin();
    assume_abort_if_not(manager_back >= 0 && manager_back < manager_size);
    assume_abort_if_not(manager[manager_back] == update);
    manager_back++;
    __VERIFIER_atomic_end();

    __VERIFIER_atomic_begin();
    assume_abort_if_not(client_back > client_front && client_front >= 0 && client_back < client_size);
    safe = safe && client[client_front] == ok;
    client_front++;
    __VERIFIER_atomic_end();
  }
}

void main() {
  pthread_t t1, t2, t3, t4;

  safe = 1;
  
  manager_size = __VERIFIER_nondet_int();
  manager_front = __VERIFIER_nondet_int();
  manager_back = manager_front;
  manager = create_fresh_int_array(manager_size);
  
  client_front = __VERIFIER_nondet_int();
  client_back = client_front;
  client_size = __VERIFIER_nondet_int();
  client = create_fresh_int_array(client_size);
  
  node1_front = __VERIFIER_nondet_int();
  node1_back = node1_front;
  node1_size = __VERIFIER_nondet_int();
  node1 = create_fresh_int_array(node1_size);
  
  node2_front = __VERIFIER_nondet_int();
  node2_back = node2_front;
  node2_size = __VERIFIER_nondet_int();
  node2 = create_fresh_int_array(node2_size);
  
  ok = __VERIFIER_nondet_int();
  update = __VERIFIER_nondet_int();
  
  // main method
  pthread_create(&t1, NULL, thread1, NULL);
  pthread_create(&t2, NULL, thread2, NULL);
  pthread_create(&t3, NULL, thread3, NULL);
  pthread_create(&t4, NULL, thread4, NULL);
  pthread_join(t1, 0);
  pthread_join(t2, 0);
  pthread_join(t3, 0);
  pthread_join(t4, 0);
  
  assume_abort_if_not(!safe);
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