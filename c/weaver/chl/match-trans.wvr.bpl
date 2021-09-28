//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/match-trans.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var score_0 : int;
var seq_1_start_1 : int;
var seq_2_start_2 : int;
var score_3 : int;
var seq_1_start_4 : int;
var seq_2_start_5 : int;
var score_6 : int;
var seq_1_start_7 : int;
var seq_2_start_8 : int;
var result_9 : int;
var result_10 : int;
var result_11 : int;


procedure thread1() returns ()
modifies score_0, seq_1_start_1, seq_2_start_2, score_3, seq_1_start_4, seq_2_start_5, score_6, seq_1_start_7, seq_2_start_8, result_9, result_10, result_11;
{
  result_9 := ( if ( score_0 > score_3 ) then ( 0 - 1 ) else ( if ( score_0 < score_3 ) then 1 else ( if ( ( seq_1_start_1 + seq_2_start_2 ) < ( seq_1_start_4 + seq_2_start_5 ) ) then ( 0 - 1 ) else ( if ( ( seq_1_start_1 + seq_2_start_2 ) > ( seq_1_start_4 + seq_2_start_5 ) ) then 1 else 0 ) ) ) );
}

procedure thread2() returns ()
modifies score_0, seq_1_start_1, seq_2_start_2, score_3, seq_1_start_4, seq_2_start_5, score_6, seq_1_start_7, seq_2_start_8, result_9, result_10, result_11;
{
  result_10 := ( if ( score_3 > score_6 ) then ( 0 - 1 ) else ( if ( score_3 < score_6 ) then 1 else ( if ( ( seq_1_start_4 + seq_2_start_5 ) < ( seq_1_start_7 + seq_2_start_8 ) ) then ( 0 - 1 ) else ( if ( ( seq_1_start_4 + seq_2_start_5 ) > ( seq_1_start_7 + seq_2_start_8 ) ) then 1 else 0 ) ) ) );
}

procedure thread3() returns ()
modifies score_0, seq_1_start_1, seq_2_start_2, score_3, seq_1_start_4, seq_2_start_5, score_6, seq_1_start_7, seq_2_start_8, result_9, result_10, result_11;
{
  result_11 := ( if ( score_0 > score_6 ) then ( 0 - 1 ) else ( if ( score_0 < score_6 ) then 1 else ( if ( ( seq_1_start_1 + seq_2_start_2 ) < ( seq_1_start_7 + seq_2_start_8 ) ) then ( 0 - 1 ) else ( if ( ( seq_1_start_1 + seq_2_start_2 ) > ( seq_1_start_7 + seq_2_start_8 ) ) then 1 else 0 ) ) ) );
}

procedure ULTIMATE.start() returns ()
modifies score_0, seq_1_start_1, seq_2_start_2, score_3, seq_1_start_4, seq_2_start_5, score_6, seq_1_start_7, seq_2_start_8, result_9, result_10, result_11;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( ( result_9 > 0 ) && ( result_10 > 0 ) ) ==> ( result_11 > 0 ) );
  assert false; // should be unreachable
}
