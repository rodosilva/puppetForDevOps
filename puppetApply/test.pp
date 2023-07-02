exec { 'install application': 
  
  path     => '/usr/local/bin:/usr/bin:/bin',
  command  => 'install.sh',
  #creates => '/opt/myapp', - Puppet will check if file already exist.
  unless   => 'test -d /opt/myapp', #Run unless this is true
  }
