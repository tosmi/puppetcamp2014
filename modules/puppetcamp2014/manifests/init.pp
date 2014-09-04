class puppetcamp (
  $ensure = present
  ) {
  user { 'toni':
    ensure => $ensure,
    uid    => 4711,
    gid    => 100,
  }

  package { 'emacs-nox':
    ensure => installed
  } ->
  package { 'vim-enhanced':
    ensure => absent,
  }
}
