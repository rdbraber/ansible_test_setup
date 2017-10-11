VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

# Ansible server

config.vm.define :ansible do |ansible_config|
  ansible_config.vm.box = "geerlingguy/centos7"
  ansible_config.vm.hostname = "ansible.ansible.home"
  ansible_config.vm.network "private_network", ip: "192.168.20.10"
  ansible_config.vm.provision "shell", path: "configure_nodes.sh"
  config.vm.provider "virtualbox" do |v|
     v.memory = 512
     v.cpus = 1
  end
end

# testservers CentOS

  config.vm.define :devweb1 do |devweb1_config|
    devweb1_config.vm.box = "geerlingguy/centos7"
    devweb1_config.vm.hostname = "devweb1.ansible.home"
    devweb1_config.vm.network "private_network", ip: "192.168.20.11"
    devweb1_config.vm.provision "shell", path: "configure_nodes.sh"
    config.vm.provider "virtualbox" do |v|
       v.memory = 512
       v.cpus = 1
    end
  end

  config.vm.define :devweb2 do |devweb2_config|
    devweb2_config.vm.box = "geerlingguy/centos7"
    devweb2_config.vm.hostname = "devweb2.ansible.home"
    devweb2_config.vm.network "private_network", ip: "192.168.20.12"
    devweb2_config.vm.provision "shell", path: "configure_nodes.sh"
    config.vm.provider "virtualbox" do |v|
       v.memory = 2048
       v.cpus = 1
    end
  end

  config.vm.define :devdb1 do |devdb1_config|
    devdb1_config.vm.box = "geerlingguy/centos7"
    devdb1_config.vm.hostname = "devdb1.ansible.home"
    devdb1_config.vm.network "private_network", ip: "192.168.20.14"
    devdb1_config.vm.provision "shell", path: "configure_nodes.sh"
    config.vm.provider "virtualbox" do |v|
       v.memory = 512
       v.cpus = 1
    end
  end

  config.vm.define :devdb2 do |devdb2_config|
    devdb2_config.vm.box = "geerlingguy/centos7"
    devdb2_config.vm.hostname = "devdb2.ansible.home"
    devdb2_config.vm.network "private_network", ip: "192.168.20.15"
    devdb2_config.vm.provision "shell", path: "configure_nodes.sh"
    config.vm.provider "virtualbox" do |v|
       v.memory = 512
       v.cpus = 1
    end
  end

end
