//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/poker-hand-subst.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var index_of_0 : [int] int;
var char_at_1 : [int] int;
var count_occurrences_of_2 : [int] int;
var last_index_of_3 : [int] int;
var index_of_4 : [int] int;
var char_at_5 : [int] int;
var count_occurrences_of_6 : [int] int;
var last_index_of_7 : [int] int;
var index_of_8 : [int] int;
var char_at_9 : [int] int;
var count_occurrences_of_10 : [int] int;
var last_index_of_11 : [int] int;
var result_12 : int;
var i1_13 : int;
var break_14 : bool;
var i2_15 : int;
var break_16 : bool;
var result_17 : int;
var i1_18 : int;
var break_19 : bool;
var i2_20 : int;
var break_21 : bool;
var result_22 : int;
var i1_23 : int;
var break_24 : bool;
var i2_25 : int;
var break_26 : bool;


procedure thread1() returns ()
modifies index_of_0, char_at_1, count_occurrences_of_2, last_index_of_3, index_of_4, char_at_5, count_occurrences_of_6, last_index_of_7, index_of_8, char_at_9, count_occurrences_of_10, last_index_of_11, result_12, i1_13, break_14, i2_15, break_16, result_17, i1_18, break_19, i2_20, break_21, result_22, i1_23, break_24, i2_25, break_26;
{
  if (*) {
    atomic {
      assume ( ( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) ) && ( index_of_0[4] == index_of_4[4] ) );
      i1_13 := 0;
      break_14 := false;
    }
    while (*) {
      atomic {
        assume ( !break_14 && ( i1_13 <= 12 ) );
        result_12 := ( if ( ( char_at_1[i1_13] != 0 ) && ( ( char_at_1[i1_13] != 4 ) && ( ( char_at_5[i1_13] != 0 ) && ( char_at_5[i1_13] != 4 ) ) ) ) then 0 else ( if ( ( char_at_1[i1_13] != 0 ) && ( char_at_1[i1_13] != 4 ) ) then ( 0 - 1 ) else ( if ( ( char_at_5[i1_13] != 0 ) && ( char_at_5[i1_13] != 4 ) ) then 1 else result_12 ) ) );
        break_14 := ( if ( ( ( char_at_1[i1_13] != 0 ) && ( char_at_1[i1_13] != 4 ) ) || ( ( char_at_5[i1_13] != 0 ) && ( char_at_5[i1_13] != 4 ) ) ) then true else break_14 );
        i1_13 := ( i1_13 + 1 );
      }
    }
    atomic {
      assume !( !break_14 && ( i1_13 <= 12 ) );
      result_12 := ( if !break_14 then ( index_of_0[4] - index_of_4[4] ) else result_12 );
    }
  }
  else if (*) {
    atomic {
      assume ( ( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) ) && !( index_of_0[4] == index_of_4[4] ) );
      result_12 := ( index_of_0[4] - index_of_4[4] );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume ( last_index_of_3[3] == last_index_of_7[3] );
      i2_15 := 0;
      break_16 := false;
    }
    while (*) {
      atomic {
        assume ( !break_16 && ( i2_15 <= 12 ) );
        result_12 := ( if ( ( i2_15 != last_index_of_3[3] ) && ( ( ( char_at_1[i2_15] == 2 ) || ( char_at_1[i2_15] == 3 ) ) && ( ( char_at_5[i2_15] == 2 ) || ( char_at_5[i2_15] == 3 ) ) ) ) then 0 else ( if ( ( i2_15 != last_index_of_3[3] ) && ( ( char_at_1[i2_15] == 2 ) || ( char_at_1[i2_15] == 3 ) ) ) then ( 0 - 1 ) else ( if ( ( i2_15 != last_index_of_3[3] ) && ( ( char_at_5[i2_15] == 2 ) || ( char_at_5[i2_15] == 3 ) ) ) then 1 else result_12 ) ) );
        break_16 := ( if ( ( i2_15 != last_index_of_3[3] ) && ( ( char_at_1[i2_15] == 2 ) || ( ( char_at_1[i2_15] == 3 ) || ( ( char_at_5[i2_15] == 2 ) || ( char_at_5[i2_15] == 3 ) ) ) ) ) then true else break_16 );
      }
    }
    atomic {
      assume !( !break_16 && ( i2_15 <= 12 ) );
      result_12 := ( if !break_16 then ( last_index_of_3[3] - last_index_of_7[3] ) else result_12 );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume !( last_index_of_3[3] == last_index_of_7[3] );
      result_12 := ( last_index_of_3[3] - last_index_of_7[3] );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume !( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      result_12 := 1;
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) );
      assume !( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      result_12 := ( 0 - 1 );
    }
  }
  else {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) );
      assume !( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume !( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      result_12 := 0;
    }
  }
}

procedure thread2() returns ()
modifies index_of_0, char_at_1, count_occurrences_of_2, last_index_of_3, index_of_4, char_at_5, count_occurrences_of_6, last_index_of_7, index_of_8, char_at_9, count_occurrences_of_10, last_index_of_11, result_12, i1_13, break_14, i2_15, break_16, result_17, i1_18, break_19, i2_20, break_21, result_22, i1_23, break_24, i2_25, break_26;
{
  if (*) {
    atomic {
      assume ( ( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) ) && ( index_of_0[4] == index_of_8[4] ) );
      i1_18 := 0;
      break_19 := false;
    }
    while (*) {
      atomic {
        assume ( !break_19 && ( i1_18 <= 12 ) );
        result_17 := ( if ( ( char_at_1[i1_18] != 0 ) && ( ( char_at_1[i1_18] != 4 ) && ( ( char_at_9[i1_18] != 0 ) && ( char_at_9[i1_18] != 4 ) ) ) ) then 0 else ( if ( ( char_at_1[i1_18] != 0 ) && ( char_at_1[i1_18] != 4 ) ) then ( 0 - 1 ) else ( if ( ( char_at_9[i1_18] != 0 ) && ( char_at_9[i1_18] != 4 ) ) then 1 else result_17 ) ) );
        break_19 := ( if ( ( ( char_at_1[i1_18] != 0 ) && ( char_at_1[i1_18] != 4 ) ) || ( ( char_at_9[i1_18] != 0 ) && ( char_at_9[i1_18] != 4 ) ) ) then true else break_19 );
        i1_18 := ( i1_18 + 1 );
      }
    }
    atomic {
      assume !( !break_19 && ( i1_18 <= 12 ) );
      result_17 := ( if !break_19 then ( index_of_0[4] - index_of_8[4] ) else result_17 );
    }
  }
  else if (*) {
    atomic {
      assume ( ( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) ) && !( index_of_0[4] == index_of_8[4] ) );
      result_17 := ( index_of_0[4] - index_of_8[4] );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_10[3] > 1 ) || ( ( count_occurrences_of_10[3] == 1 ) && ( index_of_8[2] != ( 0 - 1 ) ) ) );
      assume ( last_index_of_3[3] == last_index_of_11[3] );
      i2_20 := 0;
      break_21 := false;
    }
    while (*) {
      atomic {
        assume ( !break_21 && ( i2_20 <= 12 ) );
        result_17 := ( if ( ( i2_20 != last_index_of_3[3] ) && ( ( ( char_at_1[i2_20] == 2 ) || ( char_at_1[i2_20] == 3 ) ) && ( ( char_at_9[i2_20] == 2 ) || ( char_at_9[i2_20] == 3 ) ) ) ) then 0 else ( if ( ( i2_20 != last_index_of_3[3] ) && ( ( char_at_1[i2_20] == 2 ) || ( char_at_1[i2_20] == 3 ) ) ) then ( 0 - 1 ) else ( if ( ( i2_20 != last_index_of_3[3] ) && ( ( char_at_9[i2_20] == 2 ) || ( char_at_9[i2_20] == 3 ) ) ) then 1 else result_17 ) ) );
        break_21 := ( if ( ( i2_20 != last_index_of_3[3] ) && ( ( char_at_1[i2_20] == 2 ) || ( ( char_at_1[i2_20] == 3 ) || ( ( char_at_9[i2_20] == 2 ) || ( char_at_9[i2_20] == 3 ) ) ) ) ) then true else break_21 );
      }
    }
    atomic {
      assume !( !break_21 && ( i2_20 <= 12 ) );
      result_17 := ( if !break_21 then ( last_index_of_3[3] - last_index_of_11[3] ) else result_17 );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_10[3] > 1 ) || ( ( count_occurrences_of_10[3] == 1 ) && ( index_of_8[2] != ( 0 - 1 ) ) ) );
      assume !( last_index_of_3[3] == last_index_of_11[3] );
      result_17 := ( last_index_of_3[3] - last_index_of_11[3] );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume !( ( count_occurrences_of_10[3] > 1 ) || ( ( count_occurrences_of_10[3] == 1 ) && ( index_of_8[2] != ( 0 - 1 ) ) ) );
      result_17 := 1;
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) );
      assume !( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_10[3] > 1 ) || ( ( count_occurrences_of_10[3] == 1 ) && ( index_of_8[2] != ( 0 - 1 ) ) ) );
      result_17 := ( 0 - 1 );
    }
  }
  else {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) );
      assume !( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume !( ( count_occurrences_of_10[3] > 1 ) || ( ( count_occurrences_of_10[3] == 1 ) && ( index_of_8[2] != ( 0 - 1 ) ) ) );
      result_17 := 0;
    }
  }
}

procedure thread3() returns ()
modifies index_of_0, char_at_1, count_occurrences_of_2, last_index_of_3, index_of_4, char_at_5, count_occurrences_of_6, last_index_of_7, index_of_8, char_at_9, count_occurrences_of_10, last_index_of_11, result_12, i1_13, break_14, i2_15, break_16, result_17, i1_18, break_19, i2_20, break_21, result_22, i1_23, break_24, i2_25, break_26;
{
  if (*) {
    atomic {
      assume ( ( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) ) && ( index_of_4[4] == index_of_8[4] ) );
      i1_23 := 0;
      break_24 := false;
    }
    while (*) {
      atomic {
        assume ( !break_24 && ( i1_23 <= 12 ) );
        result_22 := ( if ( ( char_at_5[i1_23] != 0 ) && ( ( char_at_5[i1_23] != 4 ) && ( ( char_at_9[i1_23] != 0 ) && ( char_at_9[i1_23] != 4 ) ) ) ) then 0 else ( if ( ( char_at_5[i1_23] != 0 ) && ( char_at_5[i1_23] != 4 ) ) then ( 0 - 1 ) else ( if ( ( char_at_9[i1_23] != 0 ) && ( char_at_9[i1_23] != 4 ) ) then 1 else result_22 ) ) );
        break_24 := ( if ( ( ( char_at_5[i1_23] != 0 ) && ( char_at_5[i1_23] != 4 ) ) || ( ( char_at_9[i1_23] != 0 ) && ( char_at_9[i1_23] != 4 ) ) ) then true else break_24 );
        i1_23 := ( i1_23 + 1 );
      }
    }
    atomic {
      assume !( !break_24 && ( i1_23 <= 12 ) );
      result_22 := ( if !break_24 then ( index_of_4[4] - index_of_8[4] ) else result_22 );
    }
  }
  else if (*) {
    atomic {
      assume ( ( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) ) && !( index_of_4[4] == index_of_8[4] ) );
      result_22 := ( index_of_4[4] - index_of_8[4] );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_10[3] > 1 ) || ( ( count_occurrences_of_10[3] == 1 ) && ( index_of_8[2] != ( 0 - 1 ) ) ) );
      assume ( last_index_of_7[3] == last_index_of_11[3] );
      i2_25 := 0;
      break_26 := false;
    }
    while (*) {
      atomic {
        assume ( !break_26 && ( i2_25 <= 12 ) );
        result_22 := ( if ( ( i2_25 != last_index_of_7[3] ) && ( ( ( char_at_5[i2_25] == 2 ) || ( char_at_5[i2_25] == 3 ) ) && ( ( char_at_9[i2_25] == 2 ) || ( char_at_9[i2_25] == 3 ) ) ) ) then 0 else ( if ( ( i2_25 != last_index_of_7[3] ) && ( ( char_at_5[i2_25] == 2 ) || ( char_at_5[i2_25] == 3 ) ) ) then ( 0 - 1 ) else ( if ( ( i2_25 != last_index_of_7[3] ) && ( ( char_at_9[i2_25] == 2 ) || ( char_at_9[i2_25] == 3 ) ) ) then 1 else result_22 ) ) );
        break_26 := ( if ( ( i2_25 != last_index_of_7[3] ) && ( ( char_at_5[i2_25] == 2 ) || ( ( char_at_5[i2_25] == 3 ) || ( ( char_at_9[i2_25] == 2 ) || ( char_at_9[i2_25] == 3 ) ) ) ) ) then true else break_26 );
      }
    }
    atomic {
      assume !( !break_26 && ( i2_25 <= 12 ) );
      result_22 := ( if !break_26 then ( last_index_of_7[3] - last_index_of_11[3] ) else result_22 );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_10[3] > 1 ) || ( ( count_occurrences_of_10[3] == 1 ) && ( index_of_8[2] != ( 0 - 1 ) ) ) );
      assume !( last_index_of_7[3] == last_index_of_11[3] );
      result_22 := ( last_index_of_7[3] - last_index_of_11[3] );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume !( ( count_occurrences_of_10[3] > 1 ) || ( ( count_occurrences_of_10[3] == 1 ) && ( index_of_8[2] != ( 0 - 1 ) ) ) );
      result_22 := 1;
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) );
      assume !( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_10[3] > 1 ) || ( ( count_occurrences_of_10[3] == 1 ) && ( index_of_8[2] != ( 0 - 1 ) ) ) );
      result_22 := ( 0 - 1 );
    }
  }
  else {
    atomic {
      assume !( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_8[4] != ( 0 - 1 ) ) );
      assume !( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume !( ( count_occurrences_of_10[3] > 1 ) || ( ( count_occurrences_of_10[3] == 1 ) && ( index_of_8[2] != ( 0 - 1 ) ) ) );
      result_22 := 0;
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies index_of_0, char_at_1, count_occurrences_of_2, last_index_of_3, index_of_4, char_at_5, count_occurrences_of_6, last_index_of_7, index_of_8, char_at_9, count_occurrences_of_10, last_index_of_11, result_12, i1_13, break_14, i2_15, break_16, result_17, i1_18, break_19, i2_20, break_21, result_22, i1_23, break_24, i2_25, break_26;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( result_12 == 0 ) ==> ( ( ( result_17 > 0 ) == ( result_22 > 0 ) ) && ( ( result_17 < 0 ) == ( result_22 < 0 ) ) ) );
  assert false; // should be unreachable
}
