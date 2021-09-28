//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/chl/time-symm.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var ora_0 : int;
var volume_totale_1 : int;
var ora_2 : int;
var volume_totale_3 : int;
var cmp_4 : int;
var cmp_5 : int;


procedure thread1() returns ()
modifies ora_0, volume_totale_1, ora_2, volume_totale_3, cmp_4, cmp_5;
{
  atomic {
    cmp_4 := ( ora_0 - ora_2 );
    cmp_4 := ( if ( cmp_4 == 0 ) then ( volume_totale_1 - volume_totale_3 ) else cmp_4 );
  }
}

procedure thread2() returns ()
modifies ora_0, volume_totale_1, ora_2, volume_totale_3, cmp_4, cmp_5;
{
  atomic {
    cmp_5 := ( ora_2 - ora_0 );
    cmp_5 := ( if ( cmp_5 == 0 ) then ( volume_totale_3 - volume_totale_1 ) else cmp_5 );
  }
}

procedure ULTIMATE.start() returns ()
modifies ora_0, volume_totale_1, ora_2, volume_totale_3, cmp_4, cmp_5;
{
  fork 1 thread1();
  fork 2,2 thread2();
  join 1;
  join 2,2;
  assume !( ( if ( cmp_4 < 0 ) then ( - 1 ) else ( if ( cmp_4 > 0 ) then 1 else 0 ) ) == ( 0 - ( if ( cmp_5 < 0 ) then ( - 1 ) else ( if ( cmp_5 > 0 ) then 1 else 0 ) ) ) );
  assert false; // should be unreachable
}
