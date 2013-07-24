#Vagrant-LAMP
Vagrant configuration files for LAMP VM using a CentOS 64bit box (attempting to approximate Bluehost's server environment)

##Download Modules
Download the following to `puppet/modules` directory:

* puppetlabs/apache
  * puppetlabs/stdlib
  * ripienaar/concat
* puppetlabs/mysql
* puppetlabs/firewall

From within the VM, issue the following command:

    puppet module install [username]/[modulename] --target-dir /vagrant/puppet/modules

Alternatively, download some or all of the modules above from GitHub. Ensure that each module directory has the bare name of the module (remove `puppetlabs-` from each directory name, if necessary).

###phpMyAdmin
Includes phpMyAdmin module

## FatCatch Design
[FatCatch Design](https://www.fatcatchdesign.com/)

<info@fatcatchdesign>
