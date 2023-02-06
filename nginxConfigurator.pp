node www.actestsite.com {

  class { 'nginx': }
  nginx::vhost { 'www.anothertestsite.com':
    docroot => 'var/www/html/www.anothertestsite.com'
}
