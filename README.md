# Ansible test setup

This vagrant files can be used to setup a test environment for Ansible.
It will configure 5 nodes:

- ansible: this host has Ansible installed
- devweb1, devweb2: testservers, which can be used for the installation of a webserver
- devdb1, devdb2: testservers, which can be used for the installation of a database-server

The public key of the root account of the ansible server is copied to the testservers.
An inventory file is available in the directory /vagrant/ansible.
