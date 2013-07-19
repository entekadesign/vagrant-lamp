class phpmyadmin {

  package { 'phpMyAdmin':
    ensure  => present,
  }

  file { '/etc/httpd/conf.d/phpMyAdmin.conf':
    owner   => root,
    group   => root,
    mode    => 644,
    replace => true,
    ensure  => present,
    source  => '/vagrant/puppet/modules/phpmyadmin/files/phpMyAdmin.conf',
    require => Package["httpd"],
    notify  => Service["httpd"],
  }

  file { '/etc/phpMyAdmin/config.inc.php':
    owner   => root,
    group   => root,
    mode    => 644,
    replace => true,
    ensure  => present,
    source  => '/vagrant/puppet/modules/phpmyadmin/files/phpmy_admin_config.inc.php',
    require => Package['phpMyAdmin']
  }

}