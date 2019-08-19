# Ansible for the Windows Admin

This repository contains all presentation and demo material for the 2019 PowerShell Summit presentation [*Ansible for the Windows Admin*](https://youtu.be/ZI20Y10OKd0).  The repository should contain everything needed to duplicate the presentation, with the following pre-requisites:

1. VirtualBox
2. VSCode
3. Windows Subsystem for Linux (WSL)

Presumably this would work on a non-windows machine with only items 1 and 2 being a prerequisite.  If it works on a mac let me know!

## Launcher

The presentation flow is itself controlled by an ansible playbook.  This is located in the [launcher](./launcher) folder.  This playbook alternates between opening powerpoint and vscode for the various slides and demos.

## Slides

Slide decks are in the [powerpoints](./powerpoints) folder.  These are called individually by the launcher playbook, but the content goes in order 1-5.

## Vagrant

the [Vagrantfile](./VagrantFile) defines the three machines used in the demos.  It uses VirtualBox for the windows VMs, and defines a total of 10gb of RAM for the three machines

## Demos

The demos are contained in the numbered folders.  These folders are configured to be self-contained environments for ansible playbooks.  Notes are contained in each folder where applicable.

