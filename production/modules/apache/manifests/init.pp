class apache (
  Integer $port = 80,
  String $docroot = '/var/www/html',
)
{

  #$package_name = 'httpd'
  #$service_name = 'httpd'
  #$config_file = 'etc/httpd/conf/httpd.conf'

  case $::facts['os']['family'] {
    
    "Redhat": {
      $package_name = 'httpd'
      $service_name = 'httpd'
      $config_file = '/etc/httpd/conf/httpd.conf'
    }

    "Debian": {
       $package_name = 'apache2'
       $service_name = 'apache2'
       $config_file = '/etc/apache2/apache2.conf'
    }

    default: {
      fail('Unknown operating system')
    }
  }

  package { $package_name:
    ensure => installed,
  }

   file { $config_file:
   ensure      => file,
   #source     => 'puppet:///modules/apache/httpd_minimal.conf',
   content     => epp('apache/httpd.conf.epp', {
     'port'    => $port,
     'docroot' => $docroot,
     }),
   require => Package[$package_name],
   }

   service {$service_name:
     ensure    => running,
     enable    => true,
     subscribe => File[$config_file],
   }

}

