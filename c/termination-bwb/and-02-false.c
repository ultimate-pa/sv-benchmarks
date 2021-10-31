// SPDX-FileCopyrightText: 2021 Y. Cyrus Liu <yliu195@stevens.edu>
//
// SPDX-License-Identifier: Apache-2.0

/*
 * Date: 2021-06-21
 * Author: yliu195@stevens.edu
 */

extern int __VERIFIER_nondet_int() __attribute__ ((__noreturn__));
int main (){
    int a;
    int x;
    x = __VERIFIER_nondet_int();
    a = 16;
    while (x==0){
        a--;
        if (x >= 0){
           x = x&a;
        }
        else {
            x++;
        }
    }
    return 0;
}
