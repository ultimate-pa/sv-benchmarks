// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2001-2016 Daniel Kroening, Computer Science Department, University of Oxford
// SPDX-FileCopyrightText: 2001-2016 Edmund Clarke, Computer Science Department, Carnegie Mellon University
// SPDX-FileCopyrightText: 2012 FBK-ES <https://es.fbk.eu/>
// SPDX-FileCopyrightText: 2012-2021 The SV-Benchmarks Community
//
// SPDX-License-Identifier: Apache-2.0
// SPDX-License-Identifier: LicenseRef-BSD-4-Clause-Attribution-Kroening-Clarke

extern unsigned int __VERIFIER_nondet_uint();
extern char __VERIFIER_nondet_char();
extern int __VERIFIER_nondet_int();
extern long __VERIFIER_nondet_long();
extern unsigned long __VERIFIER_nondet_ulong();
extern float __VERIFIER_nondet_float();
extern void exit(int);

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "gcd_2.c", 3, "reach_error"); }

extern char __VERIFIER_nondet_char(void);
void __VERIFIER_assert(int cond) {
  if (!(cond)) {
    ERROR: {reach_error();abort();}
  }
  return;
}
signed char gcd_test(signed char a, signed char b)
{
    signed char t;

    if (a < (signed char)0) a = -a;
    if (b < (signed char)0) b = -b;

    while (b != (signed char)0) {
        t = b;
        b = a % b;
        a = t;
    }
    return a;
}


int main1()
{
    signed char x = __VERIFIER_nondet_char();
    signed char y = __VERIFIER_nondet_char();
    signed char g;

    g = gcd_test(x, y);

    if (y > (signed char)0) {
        __VERIFIER_assert(y >= g);
    }

    return 0;
}

extern void abort(void);

extern void __assert_fail (const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern void __assert_perror_fail (int __errnum, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));

extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}
extern float __VERIFIER_nondet_float(void);
float f(float x)
{
  return x - (x*x*x)/6.0f + (x*x*x*x*x)/120.0f + (x*x*x*x*x*x*x)/5040.0f;
}

float fp(float x)
{
  return 1 - (x*x)/2.0f + (x*x*x*x)/24.0f + (x*x*x*x*x*x)/720.0f;
}

int main2()
{
  float IN = __VERIFIER_nondet_float();
  assume_abort_if_not(IN > -0.6f && IN < 0.6f);

  float x = IN - f(IN)/fp(IN);

  x = x - f(x)/fp(x);

  x = x - f(x)/fp(x);



  if(!(x < 0.1))
    {reach_error();}

  return 0;
}
int main()
{
  if(__VERIFIER_nondet_int())
    main1();
  else
    main2();
}