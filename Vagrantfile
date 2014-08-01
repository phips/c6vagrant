# -*- mode: ruby -*-
# vi: set ft=ruby sw=2 ts=2:

# figure out which hosts are getting destroyed
destroy = ARGV.select { |x| !x.start_with?('-') }
if destroy.length > 0 and destroy[0] == 'destroy'
  destroy.shift # left over array destroy should be list of hosts or []
  if destroy.length == 0
    destroy = true  # destroy everything
  end
else
  destroy = false   # destroy nothing
end
# 

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # master VM
  config.vm.define "master", primary: true do |master|
    master.vm.box = "c65lvm"
    master.box_url = "http://vntx.cc/boxes/c65lvm_vmware.box"
    master.vm.provider :vmware_fusion do |vmw|
      vmw.vmx["memsize"] = "512"
    end
    master.vm.provision "ansible" do |a|
      a.playbook          = "site.yml"
      # a.limit             = 'all'
      a.sudo              = true
      a.host_key_checking = false
    end
  end

  # chef-server VM
  config.vm.define "chef" do |cs|
    cs.vm.box = "c65lvm"
    cs.box_url = "http://vntx.cc/boxes/c65lvm_vmware.box"
    cs.vm.provider :vmware_fusion do |vmw|
      vmw.vmx["memsize"] = "1024"
    end
    cs.vm.provision "ansible" do |a|
      a.playbook          = "site.yml"
      a.sudo              = true
      a.host_key_checking = false
    end
  end

  # chef-client VM
  config.vm.define "chef-client" do |cc|
    cc.vm.box = "c65lvm"
    cc.box_url = "http://vntx.cc/boxes/c65lvm_vmware.box"
    cc.vm.network "forwarded_port", guest: 80, host: 8081
    cc.vm.provider :vmware_fusion do |vmw|
      vmw.vmx["memsize"] = "512"
    end
    cc.vm.provision "ansible" do |a|
      a.playbook          = "site.yml"
      a.sudo              = true
      a.host_key_checking = false
    end
  end

  # puppetmaster VM
  config.vm.define "puppet" do |pm|
    pm.vm.box = "c65lvm"
    pm.box_url = "http://vntx.cc/boxes/c65lvm_vmware.box"
    pm.vm.provider :vmware_fusion do |vmw|
      vmw.vmx["memsize"] = "512"
    end
    pm.vm.provision "ansible" do |a|
      a.playbook          = "site.yml"
      a.sudo              = true
      a.host_key_checking = false
    end
  end

  # puppet-client VM
  config.vm.define "puppet-client" do |pc|
    pc.vm.box = "c65lvm"
    pc.box_url = "http://vntx.cc/boxes/c65lvm_vmware.box"
    pc.vm.network "forwarded_port", guest: 80, host: 8082
    pc.vm.provider :vmware_fusion do |vmw|
      vmw.vmx["memsize"] = "512"
    end
    pc.vm.provision "ansible" do |a|
      a.playbook          = "site.yml"
      a.sudo              = true
      a.host_key_checking = false
    end
  end

  # chef-client VM
  config.vm.define "ansible-target" do |at|
    at.vm.box = "c65lvm"
    at.box_url = "http://vntx.cc/boxes/c65lvm_vmware.box"
    at.vm.network "forwarded_port", guest: 80, host: 8083
    at.vm.provider :vmware_fusion do |vmw|
      vmw.vmx["memsize"] = "512"
    end
    at.vm.provision "ansible" do |a|
      a.playbook          = "site.yml"
      a.sudo              = true
      a.host_key_checking = false
    end
  end
end
