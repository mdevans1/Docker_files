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
RUN /opt/makeMIG.sh


