class resolv {

  file { '/etc/resolv.conf':
          ensure => present,
          owner  => root,
          group  => root,
          mode => 644,
          source  => '/vagrant/puppet/modules/resolv/files/resolv.conf',
  }

}