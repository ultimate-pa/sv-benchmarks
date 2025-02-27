// SPDX-FileCopyrightText: 2021 Y. Cyrus Liu <yliu195@stevens.edu>
//
// SPDX-License-Identifier: Apache-2.0

/*
 * Date: 2021-06-21
 * Author: yliu195@stevens.edu
 */


extern int __VERIFIER_nondet_int() __attribute__ ((__noreturn__));

int main (){
    int a, b;
    int x;
    a = 16;
    b = 30;
    x = __VERIFIER_nondet_int();

    while (x>0){
        a++;
        b = b|a;
        x= x-b;
     }
    return 0;
}
