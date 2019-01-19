#!/bin/bash

yum update

yum install epel-release -y

yum install salt-minion wget -y

if [[ ! -d "/srv/salt" ]]; then
	mkdir /srv/salt
else
	echo "'/srv/salt' exists"
done;

if [[ ! -d "/srv/salt/bin" ]]; then
	mkdir /srv/salt/bin
else
	echo "'/srv/salt/bin' exists"
done;

echo "Pulling salt files from GitHub..."

wget 