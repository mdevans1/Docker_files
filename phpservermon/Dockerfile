FROM centos:latest
MAINTAINER devstdout.me

#Update the image with the latest packages
RUN yum update -y; yum clean all

#Install PHP
RUN yum install -y php php-pdo php-mysql

#install and configure mariadb-server
RUN yum install -y mariadb-server

#install cron
RUN yum install -y cronie
RUN echo "*/15 * * * * root /usr/bin/php /var/www/html/phpservermon/cron/status.cron.php" >> /etc/crontab

#Set Timezone information
RUN ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

#move phpservermon into web directory
ADD ./phpservermon.tar /var/www/html/

ADD ./startup.sh /opt/startup.sh
ADD ./initdatabase.sh /opt/initdatabase.sh

RUN chmod +x /opt/startup.sh
RUN chmod +x /opt/initdatabase.sh
