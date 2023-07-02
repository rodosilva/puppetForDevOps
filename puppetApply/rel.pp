file { '/home/bob/test.txt':
  ensure  => file,
  require => User['bob'],
}

user { 'bob':
  ensure => present,
}
