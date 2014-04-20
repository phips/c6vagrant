# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # First VM
  config.vm.define "host1", primary: true do |host1|
    host1.vm.box = "c65lvm"
#   host1.vm.network "forwarded_port", guest: 8080, host: 8080
    host1.vm.provider :vmware_fusion do |vmw|
      vmw.vmx["memsize"] = "1024"
    end
    host1.vm.provision "ansible" do |a|
        a.playbook          = "site.yml"
        a.sudo              = true
        a.host_key_checking = false
        a.extra_vars        = {
            myname: 'host1'
        }
    end
  end

  # Second VM
  config.vm.define "host2", primary: true do |host2|
    host2.vm.box = "c65lvm"
#   host2.vm.network "forwarded_port", guest: 8080, host: 8080
    host2.vm.provider :vmware_fusion do |vmw|
      vmw.vmx["memsize"] = "1024"
    end
    host2.vm.provision "ansible" do |a|
        a.playbook          = "site.yml"
        a.sudo              = true
        a.host_key_checking = false
        a.extra_vars        = {
            myname: 'host2'
        }
    end
  end
end
