# Django
#
# VERSION 1.0

# a light weight linux distro
FROM ubuntu:precise

MAINTAINER Brad Corso <bcorso1@gmail.com>

# update
RUN apt-get update
RUN apt-get upgrade -y

# install dependencies
RUN apt-get install -y python-pip
RUN apt-get install -y python-dev
RUN apt-get install -y build-essential
RUN pip install Django==1.6.5

# create data directory
RUN mkdir /django

# set directory for entrypoint
WORKDIR /django
