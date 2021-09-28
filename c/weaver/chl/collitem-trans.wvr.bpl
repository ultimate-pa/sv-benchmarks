//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/collitem-trans.wvr'.
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
var cardSet_8 : int;
var cardRarity_9 : int;
var cardId_10 : int;
var cardType_11 : int;
var result_12 : int;
var result_13 : int;
var result_14 : int;


procedure thread1() returns ()
modifies cardSet_0, cardRarity_1, cardId_2, cardType_3, cardSet_4, cardRarity_5, cardId_6, cardType_7, cardSet_8, cardRarity_9, cardId_10, cardType_11, result_12, result_13, result_14;
{
  atomic {
    result_12 := ( cardSet_0 - cardSet_4 );
    result_12 := ( if ( result_12 == 0 ) then ( cardRarity_1 - cardRarity_5 ) else result_12 );
    result_12 := ( if ( result_12 == 0 ) then ( cardId_2 - cardId_6 ) else result_12 );
    result_12 := ( if ( result_12 == 0 ) then ( cardType_3 - cardType_7 ) else result_12 );
  }
}

procedure thread2() returns ()
modifies cardSet_0, cardRarity_1, cardId_2, cardType_3, cardSet_4, cardRarity_5, cardId_6, cardType_7, cardSet_8, cardRarity_9, cardId_10, cardType_11, result_12, result_13, result_14;
{
  atomic {
    result_13 := ( cardSet_4 - cardSet_8 );
    result_13 := ( if ( result_13 == 0 ) then ( cardRarity_5 - cardRarity_9 ) else result_13 );
    result_13 := ( if ( result_13 == 0 ) then ( cardId_6 - cardId_10 ) else result_13 );
    result_13 := ( if ( result_13 == 0 ) then ( cardType_7 - cardType_11 ) else result_13 );
  }
}

procedure thread3() returns ()
modifies cardSet_0, cardRarity_1, cardId_2, cardType_3, cardSet_4, cardRarity_5, cardId_6, cardType_7, cardSet_8, cardRarity_9, cardId_10, cardType_11, result_12, result_13, result_14;
{
  atomic {
    result_14 := ( cardSet_0 - cardSet_8 );
    result_14 := ( if ( result_14 == 0 ) then ( cardRarity_1 - cardRarity_9 ) else result_14 );
    result_14 := ( if ( result_14 == 0 ) then ( cardId_2 - cardId_10 ) else result_14 );
    result_14 := ( if ( result_14 == 0 ) then ( cardType_3 - cardType_11 ) else result_14 );
  }
}

procedure ULTIMATE.start() returns ()
modifies cardSet_0, cardRarity_1, cardId_2, cardType_3, cardSet_4, cardRarity_5, cardId_6, cardType_7, cardSet_8, cardRarity_9, cardId_10, cardType_11, result_12, result_13, result_14;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( ( result_12 > 0 ) && ( result_13 > 0 ) ) ==> ( result_14 > 0 ) );
  assert false; // should be unreachable
}
