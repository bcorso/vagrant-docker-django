# Django
#
# VERSION 1.0

# use the ubuntu base image provided by dotCloud
FROM ubuntu:precise

MAINTAINER Brad Corso bcorso1@gmail.com

# make sure the package repository is up to date
Run apt-get update

# install the needed libraries
Run apt-get install -y python-pip
Run apt-get install -y libpq-dev python-dev
Run pip install django-toolbelt