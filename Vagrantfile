# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # setup vagrant VM with port forwarding and folder sharing
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 8000, host: 8888
  config.vm.synced_folder ".", "/vagrant"
  
  # provision the docker container using the Dockerfile
  config.vm.provision "docker" do |d|
    # build image from ubuntu base
    d.pull_images "ubuntu:precise"
    d.build_image "/vagrant", args: "-t bcorso/django"
  end
end
