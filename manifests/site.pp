node 'puppet-server' {
   include role::master_server
 }
node 'node-2' {
   
 } 


node 'node-1' {

    include role::db_server
}
