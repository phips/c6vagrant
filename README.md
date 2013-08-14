# CentOS 6 Vagrant setup with Puppet

A basic install of a [@core CentOS6 Vagrant Box](http://vntx-box.s3.amazonaws.com/centos6.box).

Look at [bootstrap.pp](http://github.com/phips/c6vagrant/blob/master/puppet/manifests/bootstrap.pp) to see what Puppet is doing to the base CentOS6 [box](http://docs.vagrantup.com/v2/virtualbox/boxes.html).

The master branch now just contains a vanilla box, with nothing extra. Checkout
other branches for extra functionality (i.e. apache branch - self explanatory)

