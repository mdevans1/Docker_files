FROM centos:latest
MAINTAINER devstdout.me

#Update the image with the latest packages
RUN yum update -y; yum clean all

#Install Build tools
RUN yum install -y gcc gcc-c++ make automake readline-devel

#Install Go
RUN yum install -y go mercurial

#install git
RUN yum install -y git

#clone the MIG source
RUN git clone https://github.com/mozilla/mig.git

ADD ./makeMIG.sh /opt/makeMIG.sh
RUN chmod +x /opt/makeMIG.sh
#RUN /opt/makeMIG.sh

#install cron
#RUN yum install -y cronie
#RUN echo "*/15 * * * * root /usr/bin/php /var/www/html/phpservermon/cron/status.cron.php" >> /etc/crontab

#Set Timezone information
#RUN ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

#move phpservermon into web directory and rename
#ADD ./phpservermon.tar.gz /var/www/html/
#RUN mv /var/www/html/phpservermon* /var/www/html/phpservermon

#ADD ./startup.sh /opt/startup.sh
#ADD ./initdatabase.sh /opt/initdatabase.sh

#RUN chmod +x /opt/startup.sh
#RUN chmod +x /opt/initdatabase.sh
