# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 8000, host: 8888
  config.vm.synced_folder ".", "/vagrant"
  
  # this takes care of deleting any old docker containers
  config.vm.provision "shell", inline: "if [ hash docker 2>/dev/null ] && [ -n $(docker ps -a -q) ]; then echo 'Deleting:' $(docker ps -a -q); docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); fi"
  
  
  # new-image-name = bcorso/django
  # port-forwarding = 8000 => 8000
  config.vm.provision "docker" do |d|
    # pull ubuntu from public server if it doesnt exist
    d.pull_images "ubuntu:precise"
	
	# build a new image based off the Dockerfile with name bcorso/django
    d.build_image "/vagrant", args: "-t bcorso/django"
	
	# run the new image as daemon with volume sharing and port forwarding
	# also, setup a django project if it doesn't exist already.
	d.run "bcorso/django",
	  cmd: "/bin/bash -c 'mkdir /django;django-admin.py startproject my_project /django;python /django/manage.py runserver 0.0.0.0:8000'",
	  args: "-d --name django -p 8000:8000 -v /vagrant/docker/django:/django"
  end
 
end
