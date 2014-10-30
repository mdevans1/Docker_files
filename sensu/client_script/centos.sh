#!/bin/bash

IFACE='eth0'
IP=$(ip -4 address show $IFACE | grep 'inet' | sed 's/.*inet \([0-9\.]\+\).*/\1/')
RABBITMQ_SERVER='127.0.0.1'
SUBSCRIPTIONS='"test" , "client"'

echo '[sensu]
name=sensu-main
baseurl=http://repos.sensuapp.org/yum/el/$releasever/$basearch/
gpgcheck=0
enabled=1' > /etc/yum.repos.d/CentOS-sensu.repo

yum install -y sensu

mkdir -p /etc/sensu/ssl && sudo cp /tmp/client_cert.pem /tmp/client_key.pem /etc/sensu/ssl

echo '{
  "rabbitmq": {
    "ssl": {
      "cert_chain_file": "/etc/sensu/ssl/client_cert.pem",
      "private_key_file": "/etc/sensu/ssl/client_key.pem"
    },
    "host": "'$RABBITMQ_SERVER'",
    "port": 5671,
    "vhost": "/sensu",
    "user": "sensu",
    "password": "mypass"
  }
}' > /etc/sensu/conf.d/rabbitmq.json

echo '{
  "client": {
    "name": "'$HOSTNAME'",
    "address": "'$IP'",
    "subscriptions": [ '$SUBSCRIPTIONS' ]
  }
}' > /etc/sensu/conf.d/client.json

yum install -y rubygems
yum install -y ruby-devel
gem install sensu-plugin --no-rdoc --no-ri

