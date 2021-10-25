#include <assert.h>
extern void abort(void);
void reach_error() { assert(0); }
void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: {reach_error();abort();} } }

#include <pthread.h>

int g;

void *t_fun(void *arg) {
  return NULL;
}

int main() {
  pthread_t id;
  pthread_create(&id, NULL, t_fun, NULL);
  g = 1;
  __VERIFIER_assert(g);
  return 0;
}
