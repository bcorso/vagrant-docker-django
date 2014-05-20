vagrant-docker-django
=====================

A Vagrant setup for running a VM that is running Docker that is running Django.

## Requirements

* [Vagrant](http://www.vagrantup.com/) version 1.6.0 or greater (for docker provisions)
* [Virtualbox](https://www.virtualbox.org)

## Usage

``` bash
# clone the repo
git clone https://github.com/bcorso/vagrant-docker-django.git

# startup your Vagrant machine / build Docker image (bcorso/django)
vagrant up

# ssh into the VM
vagrant ssh

# use bcorso/django image to create django project in the shared folder
docker run --rm -v /vagrant/django:/django bcorso/django django-admin.py startproject myproj

# use bcorso/django image to create django serve shared folder
docker run -d -v /vagrant/django:/django -p 8000:8000 bcorso/django myproj/manage.py runserver 0.0.0.0:8000
```

