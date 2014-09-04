#
# this configures our puppet test vm
#

# install required packages
#

class puppetvagrant {

  case $::osfamily {
    'Solaris': {
      $vagrant_home = '/export/home/vagrant'
      $root_home    = '/'
      case $::kernelrelease {
        '5.11': {
          require sol11
          Class['sol11'] -> Class['common']
        }
        '5.10': {
          require sol10
          Class['sol10'] -> Class['common']
        }
      }

    }
    'RedHat': {
      require rhel
      $vagrant_home = '/home/vagrant'
      $root_home    = '/root'

      Class['rhel'] -> Class['common']
    }
  }

  class {'common':
    vagrant_home => $vagrant_home,
    root_home    => $root_home,
  }
}
