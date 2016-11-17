FROM mysql
MAINTAINER Vinicius Cruz <vinaocruz@gmail.com>

RUN echo deb http://packages.dotdeb.org jessie all >>  /etc/apt/sources.list
RUN echo deb-src http://packages.dotdeb.org jessie all >>  /etc/apt/sources.list

RUN curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | bash

RUN apt-get update 
RUN apt-get install -y wget
RUN wget https://www.dotdeb.org/dotdeb.gpg
RUN apt-key add dotdeb.gpg

RUN apt-get update 
RUN apt-get install -y php7.0-fpm php7.0-mysql php7.0-cli php7.0-phalcon

RUN apt-get clean

ENV MYSQL_DATABASE myapp
ENV MYSQL_USER dev
ENV MYSQL_PASSWORD dev123
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

EXPOSE 9000