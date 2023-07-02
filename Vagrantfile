# -*- mode: ruby -*-
# vi: set ft=ruby :
#

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"

  config.vm.define 'puppet' do |puppet|
    puppet.vm.hostname = 'puppet.localdomain'
    puppet.vm.network "private_network", type: "dhcp"

    puppet.vm.provider :virtualbox do |v|
      v.memory = 4096
    end

    puppet.vm.provision "shell", inline: %Q{
      cp -r /vagrant/.vim* /root
      rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
      yum -y install git vim tree
      echo 'export PATH=$PATH:/opt/puppetlabs/puppet/bin' >> /root/.bashrc
    }
  end

  config.vm.define 'agent' do |agent|
    agent.vm.hostname = 'agent.localdomain'
    agent.vm.network "private_network", type: "dhcp"
    agent.vm.provision "shell", inline: %Q{
      cp -r /vagrant/.vim* /root
      rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
      yum -y install git vim
      echo 'export PATH=$PATH:/opt/puppetlabs/puppet/bin' >> /root/.bashrc
    }
  end

end


