#!/bin/bash
wget -O /etc/sensu/plugins/check-container.rb https://raw.github.com/sensu/sensu-community-plugins/master/plugins/docker/check-container.rb
wget -O /etc/sensu/plugins/check-docker-container.rb https://raw.github.com/sensu/sensu-community-plugins/master/plugins/docker/check-docker-container.rb
wget -O /etc/sensu/plugins/docker-container-metrics.rb https://raw.github.com/sensu/sensu-community-plugins/master/plugins/docker/docker-container-metrics.rb
chmod 755 /etc/sensu/plugins/*.rb

/opt/sensu/embedded/bin/gem install docker-api

usermod -a -G docker sensu
