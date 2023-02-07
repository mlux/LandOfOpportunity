node puppet.target.com {

  package {'nginx':
    ensure => present,
  }
  
  nginx::vhost { 'www.anothertestsite.com':
    docroot => 'var/www/html/www.anothertestsite.com',
  }
}
