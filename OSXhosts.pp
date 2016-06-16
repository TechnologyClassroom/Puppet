# This manifest is in the beta testing phase.
# This requires puppetlabs/stdlib module

file { '/etc/updatehosts.sh':
  ensure => present,
  mode   => '0755',
}

# DEBUG
file_line { 'DEBUG':
  path    => '/etc/updatehosts.sh',
  ensure  => present,
  require => File['/etc/updatehosts.sh'],
  line    => 'echo test > /etc/debug.txt',
}

file_line { 'Download HOSTSFunix':
  path    => '/etc/updatehosts.sh',
  ensure  => present,
  require => File['/etc/updatehosts.sh'],
  line    => 'curl -o /etc/HOSTSFunix.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFunix.txt',
}

file_line { 'Download HOSTSMTWRunix':
  path    => '/etc/updatehosts.sh',
  ensure  => present,
  require => File['/etc/updatehosts.sh'],
  line    => 'curl -o /etc/HOSTSMTWRunix.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRunix.txt',
}

file_line { 'Download HOSTSFunixLS':
  path    => '/etc/updatehosts.sh',
  ensure  => present,
  require => File['/etc/updatehosts.sh'],
  line    => 'curl -o /etc/HOSTSFunixLS.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFunixLS.txt',
}

file_line { 'Download HOSTSMTWRunixLS':
  path    => '/etc/updatehosts.sh',
  ensure  => present,
  require => File['/etc/updatehosts.sh'],
  line    => 'curl -o /etc/HOSTSMTWRunixLS.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRunixLS.txt',
}

file_line { 'updatehosts1':
  path    => '/etc/updatehosts.sh',
  ensure  => present,
  require => File_line['Download HOSTSMTWRunixLS'],
  line    => "if [ $(date '+%u') == '5' ];then",
}

file_line { 'updatehosts2':
  path    => '/etc/updatehosts.sh',
  ensure  => present,
  require => File_line['updatehosts1'],
  line    => '    cp /etc/HOSTSFunix.txt /etc/hosts',
}

file_line { 'updatehosts3':
  path    => '/etc/updatehosts.sh',
  ensure  => present,
  require => File_line['updatehosts2'],
  line    => 'else',
}

file_line { 'updatehosts4':
  path    => '/etc/updatehosts.sh',
  ensure  => present,
  require => File_line['updatehosts3'],
  line    => '    cp /etc/HOSTSMTWRunix.txt /etc/hosts',
}

file_line { 'updatehosts5':
  path    => '/etc/updatehosts.sh',
  ensure  => present,
  require => File_line['updatehosts4'],
  line    => 'fi',
}

cron { 'cronupdatehosts':
  ensure  => present,
  command => '/etc/updatehosts.sh',
  require => File['/etc/updatehosts.sh'],
  user    => 'root',
  #hour    => '*/1',
  special => 'reboot',
}
