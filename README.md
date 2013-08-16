#Vagrant-LAMP
Configuration files for Vagrant + Puppet to create LAMP VM using a CentOS 64bit box (attempting to approximate Bluehost's server environment)

##Configure
This configuration assumes you have installed Vagrant (`www.vagrantup.com`) and VirtualBox (`www.virtualbox.org`), and that you are using `~/Sites/fc.fatcatchdesign.dev/htdocs` for the path to your shared dirctory (on host). To change the path, edit `vagrant-lamp/Vagrantfile`

##Setup
(1) From within `vagrant-lamp` directory:

    vagrant up

An error will be reported, because modules are not installed:

    Error: Puppet::Parser::AST::Resource failed with error ArgumentError: Could not find declared class...

(2) SSH into VM:

    vagrant ssh

###Download Modules

Puppet expects the following modules in the `vagrant-lamp/puppet/modules` directory:

* puppetlabs/apache
  * puppetlabs/stdlib
  * ripienaar/concat
* puppetlabs/mysql
* puppetlabs/firewall

(3) From the VM command line:

    puppet module install [username]/[modulename] --target-dir /vagrant/puppet/modules

Alternatively, download some or all of the modules above from GitHub. Ensure that each module directory has the bare name of the module (remove `puppetlabs-` from each directory name, if necessary).

(4) Exit VM to host:

    exit

(5) Reprovision vagrant:

    vagrant provision

(6) Enjoy LAMP stack! Web server is here:

    http://localhost:8888

###phpMyAdmin
Includes phpMyAdmin module, available here:

    http://localhost:8888/phpmyadmin


## FatCatch Design
[FatCatch Design](https://www.fatcatchdesign.com/)

<info@fatcatchdesign>
