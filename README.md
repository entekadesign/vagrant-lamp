#Vagrant-LAMP
Vagrant configuration files for LAMP VM

#Download Modules
Download the following to `modules` directory by issuing--from within the VM--the command, `puppet module install [username]/[modulename] --target-dir /vagrant/puppet/modules`:
* puppetlabs/apache
  * puppetlabs/stdlib
  * ripienaar/concat
* puppetlabs/mysql
* puppetlabs/firewall

Alternatively, download some or all of the modules above from GitHub using host machine. You must rename the resulting directory by removing `puppetlabs-`