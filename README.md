# Puppet vs Chef vs Ansible

Multi VM run of a [@core CentOS 6 Vagrant Box](http://vntx.cc/boxes/c65lvm_vmware.box), used to showcase Puppet, Chef and Ansible.

Needs [Ansible](http://ansible.com) installed on your host system before running up (the irony).

Sets up [Ansible](http://ansible.com) on one host, [Puppet](http://puppetlabs.com) on a second, and [Chef](http://opscode.com) on a third. I'd downloaded the RPMs and dependencies beforehand, putting them in a local Yum repository.

Puppet was downloaded via yum.puppetlabs.com, using `yumdownloader --resolve` Chef was downloaded from [Getchef.com](http://www.getchef.com/chef/install/), and Ansible was built from [the source](https://github.com/ansible/ansible) using 'make rpm' in the Git checkout.

Here's the file list of my local yum repository:

```
PyYAML-3.10-3.el6.x86_64.rpm
ansible-1.6.2-0.git201405232037.el6.noarch.rpm
augeas-libs-1.0.0-5.el6_5.1.x86_64.rpm
chef-11.12.4-1.el6.x86_64.rpm
chef-server-11.1.0-1.el6.x86_64.rpm
compat-readline5-5.2-17.1.el6.x86_64.rpm
facter-2.0.1-1.el6.x86_64.rpm
hiera-1.3.3-1.el6.noarch.rpm
libselinux-ruby-2.0.94-5.3.el6_4.1.x86_64.rpm
libyaml-0.1.6-1.el6.x86_64.rpm
puppet-3.6.1-1.el6.noarch.rpm
puppet-server-3.6.1-1.el6.noarch.rpm
puppetlabs-release-el-6.noarch.rpm
python-babel-0.9.4-5.1.el6.noarch.rpm
python-crypto-2.0.1-22.el6.x86_64.rpm
python-crypto2.6-2.6.1-1.el6.x86_64.rpm
python-httplib2-0.7.7-1.el6.noarch.rpm
python-jinja2-2.2.1-1.el6.x86_64.rpm
python-keyczar-0.71c-1.el6.noarch.rpm
python-paramiko-1.7.5-2.1.el6.noarch.rpm
python-pyasn1-0.0.12a-1.el6.noarch.rpm
ruby-1.8.7.352-13.el6.x86_64.rpm
ruby-augeas-0.4.1-3.el6.x86_64.rpm
ruby-irb-1.8.7.352-13.el6.x86_64.rpm
ruby-libs-1.8.7.352-13.el6.x86_64.rpm
ruby-rdoc-1.8.7.352-13.el6.x86_64.rpm
ruby-rgen-0.6.5-2.el6.noarch.rpm
ruby-shadow-2.2.0-2.el6.x86_64.rpm
rubygem-json-1.5.5-1.el6.x86_64.rpm
rubygems-1.3.7-5.el6.noarch.rpm
sshpass-1.05-1.el6.x86_64.rpm
```
