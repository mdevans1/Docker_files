database="defaultdatabase"
username="user"
password="password"
prefix="psm_"
tempfile="/tmp/init.sql"

/usr/bin/mysql_install_db

/usr/bin/chown -R mysql:mysql /var/lib/mysql/

touch $tempfile

echo "create database $database;" >> "$tempfile"

echo "create user $username@localhost identified by '$password';" >> "$tempfile"

echo "grant all privileges on $database.* to $username@localhost;" >> "$tempfile"

/usr/bin/mysqld_safe &

sleep 5

/usr/bin/mysql -u root < $tempfile

/usr/bin/mysqladmin stop

rm $tempfile

echo "<?php
define('PSM_DB_HOST', 'localhost');
define('PSM_DB_NAME', '$database');
define('PSM_DB_USER', '$username');
define('PSM_DB_PASS', '$password');
define('PSM_DB_PREFIX', '$prefix');" > /var/www/html/phpservermon/config.php
