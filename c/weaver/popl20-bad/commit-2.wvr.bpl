//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-bad/commit-2.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var manager : [int] int;
var manager_front : int;
var manager_back : int;
var client : [int] int;
var client_front : int;
var client_back : int;
var node_1 : [int] int;
var node_1_front : int;
var node_1_back : int;
var node_2 : [int] int;
var node_2_front : int;
var node_2_back : int;
var manager_state : int;
var client_state : int;
var node_1_state : int;
var node_2_state : int;
var update : int;
var ok : int;
var safe : bool;


procedure thread1() returns ()
modifies manager, manager_front, manager_back, client, client_front, client_back, node_1, node_1_front, node_1_back, node_2, node_2_front, node_2_back, manager_state, client_state, node_1_state, node_2_state, update, ok, safe;
{
  while (*) {
    if (*) {
      atomic {
        assume ( manager_state == 0 );
        assume ( manager_back > manager_front );
        safe := ( manager[manager_front] == update );
        manager_front := ( manager_front + 1 );
        manager_state := 1;
      }
    }
    else if (*) {
      atomic {
        assume ( manager_state == 1 );
        assume ( node_1[node_1_back] == update );
        node_1_back := ( node_1_back + 1 );
        manager_state := 2;
      }
    }
    else if (*) {
      atomic {
        assume ( manager_state == 2 );
        assume ( node_2[node_2_back] == update );
        node_2_back := ( node_2_back + 1 );
        manager_state := 3;
      }
    }
    else if (*) {
      atomic {
        assume ( manager_state == 3 );
        assume ( manager_back > manager_front );
        safe := ( manager[manager_front] == ok );
        manager_front := ( manager_front + 1 );
        manager_state := 4;
      }
    }
    else if (*) {
      atomic {
        assume ( manager_state == 4 );
        assume ( manager_back > manager_front );
        safe := ( manager[manager_front] == ok );
        manager_front := ( manager_front + 1 );
        manager_state := 5;
      }
    }
    else {
      atomic {
        assume ( manager_state == 5 );
        assume ( client[client_back] == ok );
        client_back := ( client_back + 1 );
        manager_state := 0;
      }
    }
  }
}

procedure thread2() returns ()
modifies manager, manager_front, manager_back, client, client_front, client_back, node_1, node_1_front, node_1_back, node_2, node_2_front, node_2_back, manager_state, client_state, node_1_state, node_2_state, update, ok, safe;
{
  while (*) {
    if (*) {
      atomic {
        assume ( node_1_state == 0 );
        assume ( node_1_back > node_1_front );
        safe := ( node_1[node_1_front] == update );
        node_1_front := ( node_1_front + 1 );
        node_1_state := 1;
      }
    }
    else {
      atomic {
        assume ( node_1_state == 1 );
        assume ( manager[manager_back] == ok );
        manager_back := ( manager_back + 1 );
        node_1_state := 0;
      }
    }
  }
}

procedure thread3() returns ()
modifies manager, manager_front, manager_back, client, client_front, client_back, node_1, node_1_front, node_1_back, node_2, node_2_front, node_2_back, manager_state, client_state, node_1_state, node_2_state, update, ok, safe;
{
  while (*) {
    if (*) {
      atomic {
        assume ( node_2_state == 0 );
        assume ( node_2_back > node_2_front );
        safe := ( node_2[node_2_front] == update );
        node_2_front := ( node_2_front + 1 );
        node_2_state := 1;
      }
    }
    else {
      atomic {
        assume ( node_2_state == 1 );
        assume ( manager[manager_back] == ok );
        manager_back := ( manager_back + 1 );
        node_2_state := 0;
      }
    }
  }
}

procedure thread4() returns ()
modifies manager, manager_front, manager_back, client, client_front, client_back, node_1, node_1_front, node_1_back, node_2, node_2_front, node_2_back, manager_state, client_state, node_1_state, node_2_state, update, ok, safe;
{
  while (*) {
    if (*) {
      atomic {
        assume ( client_state == 0 );
        assume ( manager[manager_back] == update );
        manager_back := ( manager_back + 1 );
        client_state := 1;
      }
    }
    else {
      atomic {
        assume ( client_state == 1 );
        assume ( client_back > client_front );
        safe := ( client[client_front] == ok );
        client_front := ( client_front + 1 );
        client_state := 0;
      }
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies manager, manager_front, manager_back, client, client_front, client_back, node_1, node_1_front, node_1_back, node_2, node_2_front, node_2_back, manager_state, client_state, node_1_state, node_2_state, update, ok, safe;
{
  assume ( ( safe == true ) && ( manager_front == manager_back ) && ( client_front == client_back ) && ( node_1_front == node_1_back ) && ( node_2_front == node_2_back ) && ( manager_state == node_1_state && manager_state == node_2_state && manager_state == client_state && manager_state == 0 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  fork 4,4,4,4 thread4();
  join 1;
  join 2,2;
  join 3,3,3;
  join 4,4,4,4;
  assume !safe;
  assert false; // should be unreachable
}
