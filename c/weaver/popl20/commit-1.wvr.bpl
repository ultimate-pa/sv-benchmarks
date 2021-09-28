//#Safe
/*
* This Boogie code was automatically generated from weaver benchmarks <https://github.com/weaver-verifier/weaver>.
* The original file name was 'weaver/examples/popl20/commit-1.wvr'.
*
* Generated: 2021-02-25T09:33:25.
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
var update : int;
var ok : int;
var safe : bool;


procedure thread1() returns ()
modifies manager, manager_front, manager_back, client, client_front, client_back, node_1, node_1_front, node_1_back, update, ok, safe;
{
  while (*) {
    atomic {
      assume ( manager_back > manager_front );
      safe := ( safe && ( manager[manager_front] == update ) );
      manager_front := ( manager_front + 1 );
    }
    atomic {
      assume ( node_1[node_1_back] == update );
      node_1_back := ( node_1_back + 1 );
    }
    atomic {
      assume ( manager_back > manager_front );
      safe := ( safe && ( manager[manager_front] == ok ) );
      manager_front := ( manager_front + 1 );
    }
    atomic {
      assume ( client[client_back] == ok );
      client_back := ( client_back + 1 );
    }
  }
}

procedure thread2() returns ()
modifies manager, manager_front, manager_back, client, client_front, client_back, node_1, node_1_front, node_1_back, update, ok, safe;
{
  while (*) {
    atomic {
      assume ( node_1_back > node_1_front );
      safe := ( safe && ( node_1[node_1_front] == update ) );
      node_1_front := ( node_1_front + 1 );
    }
    atomic {
      assume ( manager[manager_back] == ok );
      manager_back := ( manager_back + 1 );
    }
  }
}

procedure thread3() returns ()
modifies manager, manager_front, manager_back, client, client_front, client_back, node_1, node_1_front, node_1_back, update, ok, safe;
{
  while (*) {
    atomic {
      assume ( manager[manager_back] == update );
      manager_back := ( manager_back + 1 );
    }
    atomic {
      assume ( client_back > client_front );
      safe := ( safe && ( client[client_front] == ok ) );
      client_front := ( client_front + 1 );
    }
  }
}

procedure ULTIMATE.start() returns ()
modifies manager, manager_front, manager_back, client, client_front, client_back, node_1, node_1_front, node_1_back, update, ok, safe;
{
  assume ( ( safe == true ) && ( manager_front == manager_back ) && ( client_front == client_back ) && ( node_1_front == node_1_back ) );
  fork 1 thread1();
  fork 2,2 thread2();
  fork 3,3,3 thread3();
  join 1;
  join 2,2;
  join 3,3,3;
  assume !safe;
  assert false; // should be unreachable
}
