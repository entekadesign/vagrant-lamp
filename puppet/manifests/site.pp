node 'fc.fatcatchdesign.dev' {
            class { 'mysql::server':
                    config_hash => { 'root_password' => 'tundra' },
            }
            include mysql::php

            # configuring apache
            include apache
            include apache::mod::php

            apache::vhost { $::fqdn:
                    port => '80',
                    docroot => '/var/www/htdocs',
                    require => File['/var/www/htdocs'],
                    priority      => '1',
            }

            # setting up the document root
            file { ['/var/www/htdocs']:
                    ensure => directory,
            }

            # open port for web
            firewall { '0100-INPUT ACCEPT 80' :
                action => 'accept',
                dport  => 80,
                proto  => 'tcp',
            }
            
            # for EPEL packages (e.g., phpmyadmin)
            exec { "grap-epel":
              command => "/bin/rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm",
              creates => "/etc/yum.repos.d/epel.repo",
              alias   => "grab-epel",
            }

            # phpmyadmin from EPEL; no puppetlabs module available
            include phpmyadmin
}