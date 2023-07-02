

$users = [ 'kate', 'susan', 'fred', 'tom', 'harry' ]


# file { "/home/${users}/.bashrc": } This doesn't work

$users.each |String $u| {

  user { $u:
    ensure     => present,
    managehome => true,
  }

  file { "/home/${u}/.bashrc":
    ensure  => file,
    owner   => $u,
    group   => $u,
    content => 'export PATH=$PATH:/opt/puppetlabs/puppet/bin',
  }

}


