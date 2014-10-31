#!/bin/bash
wget -O /etc/sensu/plugins/check-procs.rb https://raw.github.com/sensu/sensu-community-plugins/master/plugins/processes/check-procs.rb
chmod 755 /etc/sensu/plugins/check-procs.rb
