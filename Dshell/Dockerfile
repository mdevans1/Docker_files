FROM centos:latest
MAINTAINER devstdout.me

#Update the image with the latest packages
RUN yum update -y; yum clean all

#Install PHP
RUN yum install -y python pip python-crypto python-dpkt python-ipy python-pypcap

#install and configure mariadb-server
RUN pip install pygeoip

#install cron
RUN yum install -y git

RUN git clone https://github.com/USArmyResearchLab/Dshell /tmp/Dshell

RUN make -C /tmp/Dshell
