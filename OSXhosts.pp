# This manifest is in the beta testing phase.

file { '/etc/updatehosts.sh':
  ensure => present,
}

file_line { 'Download HOSTSFunix':
  path => '/etc/updatehosts.sh',
  ensure => present,
  line => 'curl -o /etc/HOSTSFunix.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFunix.txt',
}

file_line { 'Download HOSTSMTWRunix':
  path => '/etc/updatehosts.sh',
  ensure => present,
  line => 'curl -o /etc/HOSTSMTWRunix.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRunix.txt',
}

file_line { 'Download HOSTSFunixLS':
  path => '/etc/updatehosts.sh',
  ensure => present,
  line => 'curl -o /etc/HOSTSFunixLS.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFunixLS.txt',
}

file_line { 'Download HOSTSMTWRunixLS':
  path => '/etc/updatehosts.sh',
  ensure => present,
  line => 'curl -o /etc/HOSTSMTWRunixLS.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRunixLS.txt',
}

file { '/etc/HOSTSFunixcp.sh':
  ensure => present,
}

file_line { 'cpHOSTSFunix':
  path => '/etc/HOSTSFunixcp.sh',
  ensure => present,
  line => 'cp /etc/HOSTSFunix.txt /etc/hosts',
  require => File['/etc/HOSTSFunixcp.sh'],
}

file { '/etc/HOSTSMTWRunixcp.sh':
  ensure => present,
}

file_line { 'cpHOSTSMTWRunix':
  path => '/etc/HOSTSFunixcp.sh',
  ensure => present,
  line => 'cp /etc/HOSTSFunix.txt /etc/hosts',
  require => File['/etc/HOSTSMTWRunixcp.sh'],
}

file { '/etc/HOSTSFunixLScp.sh':
  ensure => present,
}

file_line { 'cpHOSTSFunixLS':
  path => '/etc/HOSTSFunixLScp.sh',
  ensure => present,
  line => 'cp /etc/HOSTSFunixLS.txt /etc/hosts',
  require => File['/etc/HOSTSFunixLScp.sh'],
}

file { '/etc/HOSTSMTWRunixLScp.sh':
  ensure => present,
}

file_line { 'cpHOSTSMTWRunixLS':
  path => '/etc/HOSTSFunixLScp.sh',
  ensure => present,
  line => 'cp /etc/HOSTSFunixLS.txt /etc/hosts',
  require => File['/etc/HOSTSMTWRunixLScp.sh'],
}

cron { 'cronupdatehosts':
  ensure      => present,
  command     => 'sh /etc/updatehosts.sh',
  require => File['/etc/updatehosts.sh'],
  user        => 'root',
  hour        => '*/1',
}

cron { 'CopyHOSTSMTWRunix':
  ensure      => present,
  command     => 'sh /etc/HOSTSMTWRunixcp.sh',
  require => File_line['cpHOSTSMTWRunix'],
  user        => 'root',
  hour        => '*/1',
  weekday     => '0-4',
}

cron { 'CopyHOSTSFunix':
  ensure      => present,
  command     => 'sh /etc/HOSTSFunixcp.sh',
  require => File_line['cpHOSTSFunix'],
  user        => 'root',
  hour        => '*/1',
  weekday     => '5',
}
