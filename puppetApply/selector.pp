

$package_manager = $::facts['os']['family'] ? {
  /RedHat/ => 'yum', #Using Regex because normal string is case insensitive
  'debian' => 'apt',
  default  => 'Unknown',

}

notify {"Package manager is ${package_manager}": }
