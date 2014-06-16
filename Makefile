.PHONY: all

all:
	@ansible-playbook -uvagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory site.yml
