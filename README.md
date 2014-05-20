vagrant-docker-django
=====================

A Vagrant setup for running a VM that is running Docker that is running Django.

## Requirements

* [Vagrant](http://www.vagrantup.com/) version 1.2.0 or greater.
* [Virtualbox](https://www.virtualbox.org)

## Usage

``` bash
# clone the repo
git clone https://github.com/bcorso/vagrant-docker-django.git

# startup your Vagrant machine
vagrant up

# that's it. checked that it worked: localhost:8888

```

## Specifics

Check the Vagrant and Docker files for more info

* Vagrant installs:
  - ubuntu-trusty:latest
  - docker:latest
  - shared folders at host = '.'

* Docker installs:
  - ubuntu-precise:latest
  - python-pip, libpq-dev, python-dev, django-toolbelt
  - shared folders at host = './docker'
  - django project at host = './docker/django  
