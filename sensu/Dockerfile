FROM centos:latest
MAINTAINER devstdout.me

#Install EPEL from fedora and update the image

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm

RUN yum update -y; yum clean all

#Install erlang

RUN yum install -y erlang

#Install logrotate for rabbitmq dependency

RUN yum install -y logrotate

#Install rabbitmq

RUN rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
RUN rpm -Uvh https://www.rabbitmq.com/releases/rabbitmq-server/v3.4.0/rabbitmq-server-3.4.0-1.noarch.rpm

#install openssl

RUN yum install -y openssl

#Install git

RUN yum install -y git

#Create SSL Keys for rabbitmq

RUN git clone git://github.com/joemiller/joemiller.me-intro-to-sensu.git
RUN cd ./joemiller.me-intro-to-sensu/ &&\
./ssl_certs.sh clean &&\
./ssl_certs.sh generate

RUN mkdir /etc/rabbitmq/ssl
RUN cp ./joemiller.me-intro-to-sensu/server_key.pem /etc/rabbitmq/ssl/
RUN cp ./joemiller.me-intro-to-sensu/server_cert.pem /etc/rabbitmq/ssl/
RUN cp ./joemiller.me-intro-to-sensu/testca/cacert.pem /etc/rabbitmq/ssl/

ADD ./rabbitmq.config /etc/rabbitmq/rabbitmq.config

RUN rabbitmq-plugins enable rabbitmq_management

RUN /etc/init.d/rabbitmq-server start &&\
rabbitmqctl add_vhost /sensu &&\
rabbitmqctl add_user sensu mypass &&\ 
rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"

#install redis

RUN yum install -y redis

ADD ./CentOS-sensu.repo /etc/yum.repos.d/CentOS-sensu.repo

RUN yum install -y sensu

RUN mkdir /etc/sensu/ssl &\
cd ./joemiller.me-intro-to-sensu/ &&\
cp client_key.pem client_cert.pem  /etc/sensu/ssl/

ADD ./config.json /etc/sensu/config.json

ADD ./client.json /etc/sensu/conf.d/client.json
