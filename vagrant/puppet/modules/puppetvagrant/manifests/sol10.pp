#
# this configures our puppet test vm
#

# host entries
#
class sol10 {

  host {
    'vagrant-sol10.localdomain': ip => "${ipaddress}";
    'vagrant-sol10':             ip => "${ipaddress}";
  }

  Package {
    provider => 'pkgutil',
  }

  package { 'rubygems':
    ensure  => 'latest',
  }

  package { 'git':
    ensure  => 'latest',
  }

  package { 'vim':
    ensure  => 'latest',
  }

  package { 'puppet':
    ensure => '3.2.4',
    provider => 'gem',
  }

  file { '/var/lib/hiera':
    ensure => 'directory',
    replace => 'no',
  }
}
