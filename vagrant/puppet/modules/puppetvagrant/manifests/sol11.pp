#
# this configures our puppet test vm
#

# host entries
#
class sol11 {

  host {
    'vagrant-sol11.localdomain': ip => "${ipaddress}";
    'vagrant-sol11':             ip => "${ipaddress}";
  }

  package { 'git':
    ensure  => 'latest',
  }

  package { 'vim':
    ensure  => 'latest',
  }

  file { '/var/lib/hiera':
    ensure => 'directory',
    replace => 'no',
  }
}
