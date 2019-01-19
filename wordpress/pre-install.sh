#!/bin/bash

#Install pre-requisite packages
yum update -y
yum install epel-release -y
yum install salt-minion -y

#Ensure base salt directories exist
if [[ ! -d "/srv/salt" ]]; then
	echo "Creating '/srv/salt'"
	mkdir /srv/salt
else
	echo "'/srv/salt' exists"
fi

if [[ ! -d "/srv/salt/bin" ]]; then
	echo "Creating '/srv/salt/bin'"
	mkdir /srv/salt/bin
else
	echo "'/srv/salt/bin' exists"
fi

#Verify that salt directory exists (salt was properly installed). Exit 1 if ! exist.
if [[ ! -d "/etc/salt/minion" ]]; then
	echo -e "'/etc/salt/minion' directory does not exist!!!\nPlease check that package salt-minion was successfully installed\nExiting abnormally..."
	exit 1
fi

#Provision minion config with base directories specified for standalone salt config
if [[ -f "/etc/salt/minion" ]]; then
	echo "Removing minion file so we can replace it with modified standalone config"
	rm -f /etc/salt/minion

echo "Pulling salt files from GitHub..."

wget https://raw.githubusercontent.com/akalaj/saltstack/master/wordpress/top.sls -O /srv/salt/top.sls
wget https://raw.githubusercontent.com/akalaj/saltstack/master/wordpress/percona.sls -O /srv/salt/bin/percona.sls
wget https://raw.githubusercontent.com/akalaj/saltstack/master/wordpress/wordpress.sls -O /srv/salt/bin/wordpress.sls
wget https://raw.githubusercontent.com/akalaj/saltstack/master/wordpress/minion -O /etc/salt/minion