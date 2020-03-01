node node-1 {
 file {'/root/README':
  ensure => file,
  content => 'this is a change for readme',
     }
 }
