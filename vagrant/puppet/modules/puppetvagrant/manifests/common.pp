class common (
  $vagrant_home = '',
  $root_home    = ''
  ){

  if $vagrant_home == '' {
    $real_vagrant_home = '/home/vagrant'
  }
  else {
    $real_vagrant_home = $vagrant_home
  }

  if $root_home == '' {
    $real_root_home = '/root'
  }
  else {
    $real_root_home = $root_home
  }

  host {
    'puppet':     ip => '192.168.1.2';
    'master':     ip => '192.168.1.2';
    'sl6agent':   ip => '192.168.1.3';
    'sol10agent': ip => '192.168.1.4';
    'sol11agent': ip => '192.168.1.5';
  }

  package { 'hiera-puppet-helper':
    ensure   => 'installed',
    provider => 'gem',
    source   => '/vagrant/vagrant/puppet/files/hiera-puppet-helper-1.0.1.gem',
    require  => File['gemrc'],
  }

  package { 'rspec':
    ensure   => 'installed',
    provider => 'gem',
    require  => File['gemrc'],
  }

  package { 'rspec-puppet':
    ensure   => 'installed',
    provider => 'gem',
    require  => File['gemrc'],
  }

  package { 'puppet-lint':
    ensure   => 'installed',
    provider => 'gem',
    require  => File['gemrc'],
  }

  package { 'rake':
    ensure   => 'installed',
    provider => 'gem',
    require  => File['gemrc'],
  }

  package { 'puppetlabs_spec_helper':
    ensure   => 'installed',
    provider => 'gem',
    require  => File['gemrc'],
  }

  # copy files
  #
  file { 'vagrantbashrc':
    path   => "${real_vagrant_home}/.bashrc",
    source => '/vagrant/vagrant/puppet/files/bashrc',
    owner  => 'vagrant',
    group  => 'vagrant',
  }

  file { 'bashrc':
    path   => "${real_root_home}/.bashrc",
    source => '/vagrant/vagrant/puppet/files/bashrc',
    owner  => 'root',
    group  => 'root',
  }

  file { 'gemrc':
    path   => '/etc/gemrc',
    source => '/vagrant/vagrant/puppet/files/gemrc',
    owner  => 'root',
    group  => 'root',
  }

  # hiera config template files,
  # maybe used for testing hiera
  #
  file { '/etc/hiera.yaml':
    source => '/vagrant/vagrant/puppet/files/hiera.yaml',
    owner  => 'root',
    group  => 'root',
  }

  file { '/etc/puppet/hiera.yaml':
    ensure => 'link',
    target => '/etc/hiera.yaml',
  }

  file { 'puppet.conf':
    path   => '/etc/puppet/puppet.conf',
    source => '/vagrant/vagrant/puppet/files/puppet.conf',
    owner  => 'root',
    group  => 'root',
  }

  file { '/etc/puppet/modules':
    ensure => 'link',
    target => '/vagrant/modules',
    force  => true,
  }

  file { '/var/lib/hiera/defaults.yaml':
    ensure  => present,
    replace => no,
    mode    => '0644',
    content => "---\n",
  }

  file { '/var/lib/hiera/global.yaml':
    ensure  => present,
    replace => no,
    mode    => '0644',
    content => "---\n",
  }
}
