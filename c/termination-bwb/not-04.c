// SPDX-FileCopyrightText: 2021 Y. Cyrus Liu <yliu195@stevens.edu>
//
// SPDX-License-Identifier: Apache-2.0

/*
 * Date: 2021-06-21
 * Author: yliu195@stevens.edu
 */

extern int __VERIFIER_nondet_int() __attribute__ ((__noreturn__));

int main(){
    int a, x, y;
    x = __VERIFIER_nondet_int();
    y = __VERIFIER_nondet_int();
    a = 0;
    while (y != 0){
        if (x <= 0 || y<= 0){
            y = 0;
        } else {
            x = ~y;        
        }               
    }
    return 0;
}
