//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/collitem-symm.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var cardSet_0 : int;
var cardRarity_1 : int;
var cardId_2 : int;
var cardType_3 : int;
var cardSet_4 : int;
var cardRarity_5 : int;
var cardId_6 : int;
var cardType_7 : int;
var result_8 : int;
var result_9 : int;


procedure thread1() returns ()
modifies cardSet_0, cardRarity_1, cardId_2, cardType_3, cardSet_4, cardRarity_5, cardId_6, cardType_7, result_8, result_9;
{
  atomic {
    result_8 := ( cardSet_0 - cardSet_4 );
    result_8 := ( if ( result_8 == 0 ) then ( cardRarity_1 - cardRarity_5 ) else result_8 );
    result_8 := ( if ( result_8 == 0 ) then ( cardId_2 - cardId_6 ) else result_8 );
    result_8 := ( if ( result_8 == 0 ) then ( cardType_3 - cardType_7 ) else result_8 );
  }
}

procedure thread2() returns ()
modifies cardSet_0, cardRarity_1, cardId_2, cardType_3, cardSet_4, cardRarity_5, cardId_6, cardType_7, result_8, result_9;
{
  atomic {
    result_9 := ( cardSet_4 - cardSet_0 );
    result_9 := ( if ( result_9 == 0 ) then ( cardRarity_5 - cardRarity_1 ) else result_9 );
    result_9 := ( if ( result_9 == 0 ) then ( cardId_6 - cardId_2 ) else result_9 );
    result_9 := ( if ( result_9 == 0 ) then ( cardType_7 - cardType_3 ) else result_9 );
  }
}

procedure ULTIMATE.start() returns ()
modifies cardSet_0, cardRarity_1, cardId_2, cardType_3, cardSet_4, cardRarity_5, cardId_6, cardType_7, result_8, result_9;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( result_8 < 0 ) then ( - 1 ) else ( if ( result_8 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( result_9 < 0 ) then ( - 1 ) else ( if ( result_9 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
