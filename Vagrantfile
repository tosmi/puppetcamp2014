# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "ci", primary: true do |ci|
    ci.vm.box = "tosmi/puppetcamp2014"
    ci.vm.hostname = 'ci'
    #ci.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
    ci.vm.network "forwarded_port", guest: 8080, host: 8080

    ci.vm.provision :puppet do |puppet|
      puppet.manifest_file  = "ci.pp"
      puppet.manifests_path = "vagrant/puppet/manifests"
      puppet.module_path = "vagrant/puppet/modules"
    end
  end
end
