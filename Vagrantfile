# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "c65"
  config.vm.box_url = "http://vntx.cc/boxes/c65_vmware.box"
  config.ssh.forward_agent = true

  # config.vm.network :forwarded_port, guest: 80, host: 8080
  # config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.network :public_network
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider :vmware_fusion do |v|
    v.gui = false
    v.vmx["memsize"]  = "512"
    v.vmx["numvcpus"] = "2"
  end

  # provision with ansible
  config.vm.provision "ansible" do |a|
    a.playbook          = "playbook.yaml"
    a.sudo              = true
    a.host_key_checking = false
  end
end
