class cron-apt (
  $mailon = 'error',
  $upgrade = false
) {
  package { 'cron-apt':
    ensure => installed,
  }

  file { '/etc/cron-apt/config':
    content => template('cron-apt/config.erb'),
    require => Package['cron-apt'],
  }

  if $upgrade {
    $upgrade_ensure = present
  } else {
    $upgrade_ensure = absent
  }

  file { '/etc/cron-apt/action.d/5-upgrade':
    ensure  => $upgrade_ensure,
    source  => 'puppet:///cron-apt/action.upgrade',
    require => Package['cron-apt'],
  }
}
