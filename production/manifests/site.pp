
node "agent.localdomain" {
  include sysadmins
  include motd
  #include apache
  class { 'apache':
    port    => 8080,
    docroot => '/tmp',
  }

  apache::vhost { 'acme.com':
    port    => 8080,
    docroot => '/var/www/acme.com',
  }

  apache::vhost { 'foo.com':
    port    => 8080,
    docroot => '/var/www/foo.com',
  }

  apache::vhost { 'tango.com':
    port    => 8080,
    docroot => '/var/www/tango.com',
  }
}
