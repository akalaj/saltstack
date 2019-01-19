#!/bin/bash

yum update

yum install epel-release -y

yum install salt-minion -y

if [[ ! -d "/srv/salt" ]]; then
	mkdir /srv/salt
else
	echo "'/srv/salt' exists"
fi

if [[ ! -d "/srv/salt/bin" ]]; then
	mkdir /srv/salt/bin
else
	echo "'/srv/salt/bin' exists"
fi

echo "Pulling salt files from GitHub..."

wget https://raw.githubusercontent.com/akalaj/saltstack/master/wordpress/init.sls -O /srv/salt/init.sls
wget https://raw.githubusercontent.com/akalaj/saltstack/master/wordpress/percona.sls -O /srv/salt/bin/percona.sls
wget https://raw.githubusercontent.com/akalaj/saltstack/master/wordpress/wordpress.sls -O /srv/salt/bin/wordpress.sls