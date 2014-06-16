.PHONY: all

all:
	@ansible-playbook site.yml --tags hosts
