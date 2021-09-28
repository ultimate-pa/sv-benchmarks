//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/poker-hand-symm.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var index_of_0 : [int] int;
var char_at_1 : [int] int;
var count_occurrences_of_2 : [int] int;
var last_index_of_3 : [int] int;
var index_of_4 : [int] int;
var char_at_5 : [int] int;
var count_occurrences_of_6 : [int] int;
var last_index_of_7 : [int] int;
var result_8 : int;
var i1_9 : int;
var break_10 : bool;
var i2_11 : int;
var break_12 : bool;
var result_13 : int;
var i1_14 : int;
var break_15 : bool;
var i2_16 : int;
var break_17 : bool;


procedure thread1() returns ()
modifies index_of_0, char_at_1, count_occurrences_of_2, last_index_of_3, index_of_4, char_at_5, count_occurrences_of_6, last_index_of_7, result_8, i1_9, break_10, i2_11, break_12, result_13, i1_14, break_15, i2_16, break_17;
{
  if (*) {
    atomic {
      assume ( ( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) ) && ( index_of_0[4] == index_of_4[4] ) );
      i1_9 := 0;
      break_10 := false;
    }
    while (*) {
      atomic {
        assume ( !break_10 && ( i1_9 <= 12 ) );
        result_8 := ( if ( ( char_at_1[i1_9] != 0 ) && ( ( char_at_1[i1_9] != 4 ) && ( ( char_at_5[i1_9] != 0 ) && ( char_at_5[i1_9] != 4 ) ) ) ) then 0 else ( if ( ( char_at_1[i1_9] != 0 ) && ( char_at_1[i1_9] != 4 ) ) then ( 0 - 1 ) else ( if ( ( char_at_5[i1_9] != 0 ) && ( char_at_5[i1_9] != 4 ) ) then 1 else result_8 ) ) );
        break_10 := ( if ( ( ( char_at_1[i1_9] != 0 ) && ( char_at_1[i1_9] != 4 ) ) || ( ( char_at_5[i1_9] != 0 ) && ( char_at_5[i1_9] != 4 ) ) ) then true else break_10 );
        i1_9 := ( i1_9 + 1 );
      }
    }
    atomic {
      assume !( !break_10 && ( i1_9 <= 12 ) );
      result_8 := ( if !break_10 then ( index_of_0[4] - index_of_4[4] ) else result_8 );
    }
  }
  else if (*) {
    atomic {
      assume ( ( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) ) && !( index_of_0[4] == index_of_4[4] ) );
      result_8 := ( index_of_0[4] - index_of_4[4] );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume ( last_index_of_3[3] == last_index_of_7[3] );
      i2_11 := 0;
      break_12 := false;
    }
    while (*) {
      atomic {
        assume ( !break_12 && ( i2_11 <= 12 ) );
        result_8 := ( if ( ( i2_11 != last_index_of_3[3] ) && ( ( ( char_at_1[i2_11] == 2 ) || ( char_at_1[i2_11] == 3 ) ) && ( ( char_at_5[i2_11] == 2 ) || ( char_at_5[i2_11] == 3 ) ) ) ) then 0 else ( if ( ( i2_11 != last_index_of_3[3] ) && ( ( char_at_1[i2_11] == 2 ) || ( char_at_1[i2_11] == 3 ) ) ) then ( 0 - 1 ) else ( if ( ( i2_11 != last_index_of_3[3] ) && ( ( char_at_5[i2_11] == 2 ) || ( char_at_5[i2_11] == 3 ) ) ) then 1 else result_8 ) ) );
        break_12 := ( if ( ( i2_11 != last_index_of_3[3] ) && ( ( char_at_1[i2_11] == 2 ) || ( ( char_at_1[i2_11] == 3 ) || ( ( char_at_5[i2_11] == 2 ) || ( char_at_5[i2_11] == 3 ) ) ) ) ) then true else break_12 );
      }
    }
    atomic {
      assume !( !break_12 && ( i2_11 <= 12 ) );
      result_8 := ( if !break_12 then ( last_index_of_3[3] - last_index_of_7[3] ) else result_8 );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume !( last_index_of_3[3] == last_index_of_7[3] );
      result_8 := ( last_index_of_3[3] - last_index_of_7[3] );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume !( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      result_8 := 1;
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) );
      assume !( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      result_8 := ( 0 - 1 );
    }
  }
  else {
    atomic {
      assume !( ( index_of_0[4] != ( 0 - 1 ) ) || ( index_of_4[4] != ( 0 - 1 ) ) );
      assume !( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume !( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      result_8 := 0;
    }
  }
}

procedure thread2() returns ()
modifies index_of_0, char_at_1, count_occurrences_of_2, last_index_of_3, index_of_4, char_at_5, count_occurrences_of_6, last_index_of_7, result_8, i1_9, break_10, i2_11, break_12, result_13, i1_14, break_15, i2_16, break_17;
{
  if (*) {
    atomic {
      assume ( ( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) ) && ( index_of_4[4] == index_of_0[4] ) );
      i1_14 := 0;
      break_15 := false;
    }
    while (*) {
      atomic {
        assume ( !break_15 && ( i1_14 <= 12 ) );
        result_13 := ( if ( ( char_at_5[i1_14] != 0 ) && ( ( char_at_5[i1_14] != 4 ) && ( ( char_at_1[i1_14] != 0 ) && ( char_at_1[i1_14] != 4 ) ) ) ) then 0 else ( if ( ( char_at_5[i1_14] != 0 ) && ( char_at_5[i1_14] != 4 ) ) then ( 0 - 1 ) else ( if ( ( char_at_1[i1_14] != 0 ) && ( char_at_1[i1_14] != 4 ) ) then 1 else result_13 ) ) );
        break_15 := ( if ( ( ( char_at_5[i1_14] != 0 ) && ( char_at_5[i1_14] != 4 ) ) || ( ( char_at_1[i1_14] != 0 ) && ( char_at_1[i1_14] != 4 ) ) ) then true else break_15 );
        i1_14 := ( i1_14 + 1 );
      }
    }
    atomic {
      assume !( !break_15 && ( i1_14 <= 12 ) );
      result_13 := ( if !break_15 then ( index_of_4[4] - index_of_0[4] ) else result_13 );
    }
  }
  else if (*) {
    atomic {
      assume ( ( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) ) && !( index_of_4[4] == index_of_0[4] ) );
      result_13 := ( index_of_4[4] - index_of_0[4] );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume ( last_index_of_7[3] == last_index_of_3[3] );
      i2_16 := 0;
      break_17 := false;
    }
    while (*) {
      atomic {
        assume ( !break_17 && ( i2_16 <= 12 ) );
        result_13 := ( if ( ( i2_16 != last_index_of_7[3] ) && ( ( ( char_at_5[i2_16] == 2 ) || ( char_at_5[i2_16] == 3 ) ) && ( ( char_at_1[i2_16] == 2 ) || ( char_at_1[i2_16] == 3 ) ) ) ) then 0 else ( if ( ( i2_16 != last_index_of_7[3] ) && ( ( char_at_5[i2_16] == 2 ) || ( char_at_5[i2_16] == 3 ) ) ) then ( 0 - 1 ) else ( if ( ( i2_16 != last_index_of_7[3] ) && ( ( char_at_1[i2_16] == 2 ) || ( char_at_1[i2_16] == 3 ) ) ) then 1 else result_13 ) ) );
        break_17 := ( if ( ( i2_16 != last_index_of_7[3] ) && ( ( char_at_5[i2_16] == 2 ) || ( ( char_at_5[i2_16] == 3 ) || ( ( char_at_1[i2_16] == 2 ) || ( char_at_1[i2_16] == 3 ) ) ) ) ) then true else break_17 );
      }
    }
    atomic {
      assume !( !break_17 && ( i2_16 <= 12 ) );
      result_13 := ( if !break_17 then ( last_index_of_7[3] - last_index_of_3[3] ) else result_13 );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      assume !( last_index_of_7[3] == last_index_of_3[3] );
      result_13 := ( last_index_of_7[3] - last_index_of_3[3] );
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) );
      assume ( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume !( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      result_13 := 1;
    }
  }
  else if (*) {
    atomic {
      assume !( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) );
      assume !( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume ( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      result_13 := ( 0 - 1 );
    }
  }
  else {
    atomic {
      assume !( ( index_of_4[4] != ( 0 - 1 ) ) || ( index_of_0[4] != ( 0 - 1 ) ) );
      assume !( ( count_occurrences_of_6[3] > 1 ) || ( ( count_occurrences_of_6[3] == 1 ) && ( index_of_4[2] != ( 0 - 1 ) ) ) );
      assume !( ( count_occurrences_of_2[3] > 1 ) || ( ( count_occurrences_of_2[3] == 1 ) && ( index_of_0[2] != ( 0 - 1 ) ) ) );
      result_13 := 0;
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies index_of_0, char_at_1, count_occurrences_of_2, last_index_of_3, index_of_4, char_at_5, count_occurrences_of_6, last_index_of_7, result_8, i1_9, break_10, i2_11, break_12, result_13, i1_14, break_15, i2_16, break_17;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_8 < 0 ) then ( - 1 ) else ( if ( result_8 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_13 < 0 ) then ( - 1 ) else ( if ( result_13 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
