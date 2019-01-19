#!/bin/bash

yum update

yum install epel-release -y

yum install salt-minion salt-master -y

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

echo "Pulling salt files from GitHub..."

wget https://raw.githubusercontent.com/akalaj/saltstack/master/wordpress/top.sls -O /srv/salt/top.sls
wget https://raw.githubusercontent.com/akalaj/saltstack/master/wordpress/percona.sls -O /srv/salt/bin/percona.sls
wget https://raw.githubusercontent.com/akalaj/saltstack/master/wordpress/wordpress.sls -O /srv/salt/bin/wordpress.sls