# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # setup vagrant VM with port forwarding and folder sharing
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 8000, host: 8888
  config.vm.synced_folder ".", "/vagrant"
  
  # delete old docker containers
  config.vm.provision "shell", inline: "if [ hash docker 2>/dev/null ] && [ -n $(docker ps -a -q) ]; then echo 'Deleting:' $(docker ps -a -q); docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); fi"
  
  # provision the docker container using the Dockerfile
  config.vm.provision "docker" do |d|
    # build image from ubuntu base
    d.pull_images "ubuntu:precise"
    d.build_image "/vagrant", args: "-t bcorso/django"

    # setup volume sharing, port forwarding, and django
    d.run "bcorso/django",
      cmd: "/bin/bash -c 'mkdir /django;django-admin.py startproject my_project /django;python /django/manage.py runserver 0.0.0.0:8000'",
      args: "-d --name django -p 8000:8000 -v /vagrant/docker/django:/django"
  end
end
