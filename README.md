# CentOS 6 Vagrant setup with Ansible

A basic install of a [@core CentOS 6 Vagrant Box](http://vntx.cc/boxes/centos65.box).

You need [Ansible](http://ansibleworks.com) installed on your host system
before running this up.

Look at
[playbook.yaml](http://github.com/phips/c6vagrant/blob/master/playbook.yaml) to
see what Ansible is doing to the base CentOS 6
[box](http://docs.vagrantup.com/v2/virtualbox/boxes.html).

The master branch now just contains a vanilla box, with nothing extra. Checkout
other branches for extra functionality (i.e. apache branch - self explanatory)

