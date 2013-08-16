#Vagrant-LAMP
Configuration files for Vagrant + Puppet to create LAMP VM using a CentOS 64bit box (attempting to approximate Bluehost's server environment)

##Configure
This configuration assumes you have installed Vagrant (`www.vagrantup.com`) and VirtualBox (`www.virtualbox.org`), and that you are using `~/Sites/fc.fatcatchdesign.dev/htdocs` for your shared dirctory path. To change the path, edit `vagrant-lamp/Vagrantfile`

The default resolv.conf file can prevent proper name resolving. Change the search domain as appropriate:

    vagrant-lamp/puppet/modules/resolv/files/resolv.conf

##Setup
(1) From within `vagrant-lamp` directory:

    vagrant up

(2) An error will be reported, because modules are not installed:

    Error: Puppet::Parser::AST::Resource failed with error ArgumentError: Could not find declared class...

###Download Modules

Puppet expects the following modules in the `vagrant-lamp/puppet/modules` directory:

* puppetlabs/apache
  * puppetlabs/stdlib
  * ripienaar/concat
* puppetlabs/mysql
* puppetlabs/firewall

(3) SSH into VM:

    vagrant ssh

(4) From the VM command line:

    puppet module install [username]/[modulename] --target-dir /vagrant/puppet/modules

Alternatively, download some or all of the modules above from GitHub. Ensure that each module directory has the bare name of the module (remove `puppetlabs-` from each directory name, if necessary).

(5) Exit VM to host:

    exit

(6) Reprovision vagrant:

    vagrant provision

(7) Enjoy LAMP stack! Web server is here:

    http://localhost:8888

Shared directory is here (on host):

    ~/Sites/fc.fatcatchdesign.dev/htdocs

###phpMyAdmin
Includes phpMyAdmin module, available here:

    http://localhost:8888/phpmyadmin


## FatCatch Design
[FatCatch Design](https://www.fatcatchdesign.com/)

<info@fatcatchdesign>
