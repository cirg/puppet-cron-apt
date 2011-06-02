class cron-apt (
  $mailon = 'error'
) {
  package { 'cron-apt':
    ensure => installed,
  }

  file { '/etc/cron-apt/config':
    content => template('cron-apt/config.erb'),
    require => Package['cron-apt'],
  }
}
