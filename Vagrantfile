# -*- mode: ruby -*-

Vagrant.configure('2') do |config|
  config.vm.box = "phusion/ubuntu-14.04-amd64"

  config.vm.provider :virtualbox do |v|
    v.check_guest_additions = false
    v.functional_vboxsf     = false
  end

  # apps and services network stuff
  config.vm.network "forwarded_port", guest: 4000, host: 4000, auto_correct: true

  # docker network stuff
  config.vm.network "forwarded_port", guest: 4444, host: 4444, auto_correct: true
  config.vm.network "private_network", ip: '55.55.55.55'

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.memory = 1024
    vb.cpus = 1
  end

  config.vm.synced_folder ".", "/app", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp']

  config.vm.provision 'ansible' do |ansible|
    ansible.limit = 'all'
    ansible.playbook = 'provision/vagrant-playbook.yml'
  end

end
