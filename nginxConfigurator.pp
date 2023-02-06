node www.actestsite.com {

  package {'nginx':
    ensure => present,
    before => File['/etc/ssh/sshd_config'],
  }
  
  file [
  
  
  
  nginx::vhost { 'www.anothertestsite.com':
    docroot => 'var/www/html/www.anothertestsite.com'
}
