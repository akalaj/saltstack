FROM centos:7

RUN yum update -y
RUN yum install wget curl unzip vim iproute2 epel-release -y
RUN yum install salt.noarch salt-master -y

RUN curl -sS https://raw.githubusercontent.com/akalaj/saltstack/master/msm/hosts | cat >> /etc/hosts
