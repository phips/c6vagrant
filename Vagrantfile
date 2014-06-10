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
  # First VM
  config.vm.define "host1", primary: true do |host1|
    host1.vm.box = "c65lvm"
    host1.vm.network "forwarded_port", guest: 80, host: 8081
    host1.vm.provider :vmware_fusion do |vmw|
      vmw.vmx["memsize"] = "512"
    end
    host1.vm.provision "ansible" do |a|
      a.playbook          = "site.yml"
      a.sudo              = true
      a.host_key_checking = false
    end
  end

  # Second VM
  config.vm.define "host2" do |host2|
    host2.vm.box = "c65lvm"
    host2.vm.network "forwarded_port", guest: 80, host: 8082
    host2.vm.provider :vmware_fusion do |vmw|
      vmw.vmx["memsize"] = "512"
    end
    host2.vm.provision "ansible" do |a|
      a.playbook          = "site.yml"
      a.sudo              = true
      a.host_key_checking = false
    end
  end

  # Third VM
  config.vm.define "host3" do |host3|
    host3.vm.box = "c65lvm"
    host3.vm.network "forwarded_port", guest: 80, host: 8083
    host3.vm.provider :vmware_fusion do |vmw|
      vmw.vmx["memsize"] = "1024"
    end
    host3.vm.provision "ansible" do |a|
      a.playbook          = "site.yml"
      a.sudo              = true
      a.host_key_checking = false
    end
  end
end
