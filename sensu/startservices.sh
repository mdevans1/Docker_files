#!/bin/bash

redis-server &

/etc/init.d/rabbitmq-server start
rabbitmqctl add_vhost /sensu
rabbitmqctl add_user sensu mypass
rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"

/etc/init.d/sensu-server start
/etc/init.d/sensu-api start
/etc/init.d/sensu-client start

/etc/init.d/uchiwa start
