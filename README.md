# CentOS 6 Vagrant setup with Ansible

A basic install of a [@core CentOS6 Vagrant Box](http://vntx-box.s3.amazonaws.com/centos6.box).

You need to [Ansible](http://ansibleworks.com) installed on your host system
before running this up.

Look at [playbook.yaml](http://github.com/phips/c6vagrant/blob/master/playbook.yaml) to see what Ansible is doing to the base CentOS6 [box](http://docs.vagrantup.com/v2/virtualbox/boxes.html).

The master branch now just contains a vanilla box, with nothing extra. Checkout
other branches for extra functionality (i.e. apache branch - self explanatory)

