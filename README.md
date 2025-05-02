# rook-ceph-k8s

This repo willhelp you to deploy:
 - Deploy 4 vms 
 - bootstrap kubernetes cluster
 - install rook-ceph
 - create replicated rbd pool and consume the pool for storage class

### Install

Pre-requesites:
- vagrant installed and configured for libvirt
- ansible

How to deploy:
- Clone this repo
- Replace the Master and worker ips in the vagrantfile, hosts and ansible playbook
- Add your ssh-pub key in common.sh
#### 1. Provision the vms using `vagrant up`
#### 2. Run the ansible playbook
