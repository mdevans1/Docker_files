#!/bin/bash
/usr/bin/mysqld_safe &
/usr/sbin/httpd -DFOREGROUND &
/usr/sbin/crond -n &