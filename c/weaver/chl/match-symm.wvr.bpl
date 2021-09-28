//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/match-symm.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var score_0 : int;
var seq_1_start_1 : int;
var seq_2_start_2 : int;
var score_3 : int;
var seq_1_start_4 : int;
var seq_2_start_5 : int;
var result_6 : int;
var result_7 : int;


procedure thread1() returns ()
modifies score_0, seq_1_start_1, seq_2_start_2, score_3, seq_1_start_4, seq_2_start_5, result_6, result_7;
{
  result_6 := ( if ( score_0 > score_3 ) then ( 0 - 1 ) else ( if ( score_0 < score_3 ) then 1 else ( if ( ( seq_1_start_1 + seq_2_start_2 ) < ( seq_1_start_4 + seq_2_start_5 ) ) then ( 0 - 1 ) else ( if ( ( seq_1_start_1 + seq_2_start_2 ) > ( seq_1_start_4 + seq_2_start_5 ) ) then 1 else 0 ) ) ) );
}

procedure thread2() returns ()
modifies score_0, seq_1_start_1, seq_2_start_2, score_3, seq_1_start_4, seq_2_start_5, result_6, result_7;
{
  result_7 := ( if ( score_3 > score_0 ) then ( 0 - 1 ) else ( if ( score_3 < score_0 ) then 1 else ( if ( ( seq_1_start_4 + seq_2_start_5 ) < ( seq_1_start_1 + seq_2_start_2 ) ) then ( 0 - 1 ) else ( if ( ( seq_1_start_4 + seq_2_start_5 ) > ( seq_1_start_1 + seq_2_start_2 ) ) then 1 else 0 ) ) ) );
}

procedure ULTIMATE.start() returns ()
modifies score_0, seq_1_start_1, seq_2_start_2, score_3, seq_1_start_4, seq_2_start_5, result_6, result_7;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_6 < 0 ) then ( - 1 ) else ( if ( result_6 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_7 < 0 ) then ( - 1 ) else ( if ( result_7 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
