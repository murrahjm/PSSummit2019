#!/bin/bash

#vault options
ansible-vault encrypt group_vars/all.yml --ask-vault-pass
ansible-vault decrypt group_vars/all.yml --ask-vault-pass
ansible-vault encrypt_string --ask-vault-pass 'vagrant' --name 'ansible_password'
ansible-playbook playbook.yml
ansible-playbook playbook.yml --ask-vault-pass --step