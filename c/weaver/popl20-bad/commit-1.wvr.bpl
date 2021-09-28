//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20-bad/commit-1.wvr'.
*
* Generated: 2021-02-25T09:33:23.
*/
var manager : [int] int;
var manager_front : int;
var manager_back : int;
var client : [int] int;
var client_front : int;
var client_back : int;
var node : [int] int;
var node_front : int;
var node_back : int;
var manager_state : int;
var client_state : int;
var node_state : int;
var update : int;
var ok : int;
var safe : bool;


procedure thread1() returns ()
modifies manager, manager_front, manager_back, client, client_front, client_back, node, node_front, node_back, manager_state, client_state, node_state, update, ok, safe;
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
        assume ( node[node_back] == update );
        node_back := ( node_back + 1 );
        manager_state := 2;
      }
    }
    else if (*) {
      atomic {
        assume ( manager_state == 2 );
        assume ( manager_back > manager_front );
        safe := ( manager[manager_front] == ok );
        manager_front := ( manager_front + 1 );
        manager_state := 3;
      }
    }
    else {
      atomic {
        assume ( manager_state == 3 );
        assume ( client[client_back] == ok );
        client_back := ( client_back + 1 );
        manager_state := 0;
      }
    }
  }
}

procedure thread2() returns ()
modifies manager, manager_front, manager_back, client, client_front, client_back, node, node_front, node_back, manager_state, client_state, node_state, update, ok, safe;
{
  while (*) {
    if (*) {
      atomic {
        assume ( node_state == 0 );
        assume ( node_back > node_front );
        safe := ( node[node_front] == update );
        node_front := ( node_front + 1 );
        node_state := 1;
      }
    }
    else {
      atomic {
        assume ( node_state == 1 );
        assume ( manager[manager_back] == ok );
        manager_back := ( manager_back + 1 );
        node_state := 0;
      }
    }
  }
}

procedure thread3() returns ()
modifies manager, manager_front, manager_back, client, client_front, client_back, node, node_front, node_back, manager_state, client_state, node_state, update, ok, safe;
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
modifies manager, manager_front, manager_back, client, client_front, client_back, node, node_front, node_back, manager_state, client_state, node_state, update, ok, safe;
{
  assume ( ( safe == true ) && ( manager_front == manager_back ) && ( client_front == client_back ) && ( node_front == node_back ) && ( manager_state == node_state && manager_state == client_state && manager_state == 0 ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !safe;
  assert false; // should be unreachable
}
