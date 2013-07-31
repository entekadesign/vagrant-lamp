#!/usr/bin/env bash
# This bootstraps Puppet on CentOS 6.x
# It has been tested on CentOS 6.4 64bit



REPO_URL="http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# Setup shared folders
SHARED_F="/var/www/htdocs"
echo "Setting up shared folder ${SHARED_F}..."
groupadd -f apache
useradd -g apache -r apache
mount -t vboxsf -o uid=`id -u vagrant`,gid=`id -g apache`,dmode=770,fmode=664 ${SHARED_F} ${SHARED_F}

# exit on error
set -e

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed."
  exit 0
fi

# Install puppet labs repo
echo "Configuring PuppetLabs repo..."
repo_path=$(mktemp)
wget --output-document=${repo_path} ${REPO_URL} 2>/dev/null
rpm -i ${repo_path} >/dev/null

# Install Puppet...
echo "Installing puppet"
yum install -y puppet > /dev/null

echo "Puppet installed!"

# name resolution
# ip=$(ifconfig eth0 | perl -ne 'if (/inet addr:(?<ip>.+?)\s+/){print $+{ip}}')
# if [[ $(grep -c $(hostname) /etc/hosts) -eq 0 ]]; then
#     echo "${ip} $(hostname) puppet" >> /etc/hosts
# fi

