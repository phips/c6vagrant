# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "c65"
  config.vm.box_url = "http://vntx.cc/boxes/centos65.box"
  config.ssh.forward_agent = true

  # config.vm.network :forwarded_port, guest: 80, host: 8080
  # config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.network :public_network
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
  # vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # provision with ansible
  config.vm.provision "ansible" do |a|
    a.playbook          = "play.yaml"
    a.sudo              = true
    a.host_key_checking = false
  end
end

