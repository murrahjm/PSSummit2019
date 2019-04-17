** talk about demo environment before launching demo 1 (at "demo" slide)

DEMO 1:
talk about playbook.yml
talk about hosts file
talk about host vars in hosts file and variable scoping
talk about group_vars

run playbook
show error and talk about ansible.cfg file

open prepping_wsl_env.md and talk about ansible install instructions
talk about wsl.conf file and make edit

reload bash and re-run playbook

DEMO 2:
"here we have a more complex playbook.  but before we get to that i want to talk about this:"
show group_vars file, talk about vaulting the password
run through commands.sh commands
when playbook launches walk through each command and show each one in the playbook file

DEMO 3:
start playbook and let it run in the background
talk about multiple plays in playbook.yml
show lcm scripts after reference in first play

DEMO 4:
walk through playbook.yml and run playbook.yml
talk about next section at each pause

open ps1 file, talk about building a module
	input params
	build output
	changed and check mode and diff mode for other modules
	fail-json and out-json
open py file, talk about writing documentation
