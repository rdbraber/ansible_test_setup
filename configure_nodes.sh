#!/bin/bash

# Add entries from the Vagrant file to the /etc/hosts file

IFS=$'\n'
cat /vagrant/Vagrantfile |egrep "hostname|network" |awk 'NR%2{printf $0;next;}1' | tr -d "\"" | awk '{printf $7" "$3"\n"}' > /tmp/hosts
for LINE in `cat /tmp/hosts`
do
  IP=`echo $LINE |awk '{printf $1}'`
  FQDN=`echo $LINE |awk '{printf $2}'`
  SHORT=`echo $LINE |awk '{printf $2}'|cut -d "." -f 1`
  echo "${IP} ${SHORT} ${FQDN}" >> /etc/hosts
done
rm -f /tmp/hosts 

# Restart the network, because of issues with Centos 7 systems.
# see also: https://github.com/mitchellh/vagrant/issues/5590

nmcli connection reload
systemctl restart network.service

# Install Ansible on the server ansible

if [ "`hostname -s`" = "ansible" ]
then
  # Install Ansible
  yum localinstall -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
  yum install -y --enablerepo=epel-testing ansible
  # Install redis
  yum install redis python-redis -y
  systemctl enable redis
  systemctl start redis
  # Install Git
  yum install -y git
  # Copy the ssh key for the root account
  if [ ! -e /root/.ssh ]
  then
    mkdir /root/.ssh 
    chown root:root /root/.ssh
    chmod 700 /root/.ssh
  fi
  cp -pv /vagrant/.ssh/id_rsa /root/.ssh/
  chown root:root /root/.ssh/id_rsa
  chmod 600 /root/.ssh/id_rsa
  cp -pv /vagrant/.ssh/id_rsa.pub /root/.ssh/
  chown root:root /root/.ssh/id_rsa.pub
  chmod 644 /root/.ssh/id_rsa.pub
else

  # Copy the public key of the root account to the file authorized_keys
  mkdir /root/.ssh/
  if [ -e /vagrant/.ssh/id_rsa.pub ]
  then
    cat /vagrant/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
  fi
fi
