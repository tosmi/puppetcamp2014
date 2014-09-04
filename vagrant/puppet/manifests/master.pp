class puppetmaster {
  require puppetvagrant

  augeas { 'master_puppetconf':
    context => '/files/etc/puppet/puppet.conf',
    changes => [
                'set agent/server "192.168.1.2"',
                'set master/certname "puppet"',
                'set master/dns_alt_names "vagrant-sl6,192.168.1.2"',
                'set master/autosign "true"',
                ],
    require => Package['puppet']
  }

  exec { 'puppet master --daemonize --debug':
    path    => ['/usr/bin', ],
    require => Augeas['master_puppetconf']
  }
}

include puppetmaster
