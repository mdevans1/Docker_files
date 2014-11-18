FROM centos:latest
MAINTAINER devstdout.me

#Update the image

RUN yum update -y; yum clean all

#Install Ruby

RUN yum install -y ruby ruby-devel

#Install compilation tools

RUN yum install -y gcc gcc-c++ make

#Install nodejs

RUN curl -sL https://rpm.nodesource.com/setup | bash - && yum install -y nodejs

#install dashing

RUN gem install dashing
RUN gem install bundle

RUN dashing new default_dashboard

RUN gem uninstall eventmachine thin -aIx --force

RUN bundle --gemfile ./default_dashboard/Gemfile
