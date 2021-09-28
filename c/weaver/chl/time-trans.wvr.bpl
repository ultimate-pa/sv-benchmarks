//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/time-trans.wvr'.
*
* Generated: 2021-02-25T09:33:22.
*/
var ora_0 : int;
var volume_totale_1 : int;
var ora_2 : int;
var volume_totale_3 : int;
var ora_4 : int;
var volume_totale_5 : int;
var cmp_6 : int;
var cmp_7 : int;
var cmp_8 : int;


procedure thread1() returns ()
modifies ora_0, volume_totale_1, ora_2, volume_totale_3, ora_4, volume_totale_5, cmp_6, cmp_7, cmp_8;
{
  atomic {
    cmp_6 := ( ora_0 - ora_2 );
    cmp_6 := ( if ( cmp_6 == 0 ) then ( volume_totale_1 - volume_totale_3 ) else cmp_6 );
  }
}

procedure thread2() returns ()
modifies ora_0, volume_totale_1, ora_2, volume_totale_3, ora_4, volume_totale_5, cmp_6, cmp_7, cmp_8;
{
  atomic {
    cmp_7 := ( ora_2 - ora_4 );
    cmp_7 := ( if ( cmp_7 == 0 ) then ( volume_totale_3 - volume_totale_5 ) else cmp_7 );
  }
}

procedure thread3() returns ()
modifies ora_0, volume_totale_1, ora_2, volume_totale_3, ora_4, volume_totale_5, cmp_6, cmp_7, cmp_8;
{
  atomic {
    cmp_8 := ( ora_0 - ora_4 );
    cmp_8 := ( if ( cmp_8 == 0 ) then ( volume_totale_1 - volume_totale_5 ) else cmp_8 );
  }
}

procedure ULTIMATE.start() returns ()
modifies ora_0, volume_totale_1, ora_2, volume_totale_3, ora_4, volume_totale_5, cmp_6, cmp_7, cmp_8;
{
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !( ( ( cmp_6 > 0 ) && ( cmp_7 > 0 ) ) ==> ( cmp_8 > 0 ) );
  assert false; // should be unreachable
}
