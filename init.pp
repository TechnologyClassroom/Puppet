# This manifest is in the beta testing phase.
# This requires puppetlabs/stdlib module

# init.pp
# Michael McMahon

# This file configures HOSTS to rotate between the files in https://github.com/TechnologyClassroom/HOSTS for GNU/Linux systems

file { '/etc/updatehosts.sh':
  ensure  => present,
  require => exec['puppet_module_stdlib'],
  mode    => '0755',
}

file_line { 'Download HOSTSFunix':
  ensure  => present,
  path    => '/etc/updatehosts.sh',
  require => File['/etc/updatehosts.sh'],
  line    => 'curl -o /etc/HOSTSFunix.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFunix.txt',
}

file_line { 'Download HOSTSMTWRunix':
  ensure  => present,
  path    => '/etc/updatehosts.sh',
  require => File['/etc/updatehosts.sh'],
  line    => 'curl -o /etc/HOSTSMTWRunix.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRunix.txt',
}

file_line { 'Download HOSTSFunixLS':
  ensure  => present,
  path    => '/etc/updatehosts.sh',
  require => File['/etc/updatehosts.sh'],
  line    => 'curl -o /etc/HOSTSFunixLS.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFunixLS.txt',
}

file_line { 'Download HOSTSMTWRunixLS':
  ensure  => present,
  path    => '/etc/updatehosts.sh',
  require => File['/etc/updatehosts.sh'],
  line    => 'curl -o /etc/HOSTSMTWRunixLS.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRunixLS.txt',
}

file_line { 'updatehosts1':
  ensure  => present,
  path    => '/etc/updatehosts.sh',
  require => File_line['Download HOSTSMTWRunixLS'],
  line    => "if [ $(date '+%u') == '5' ];then",
}

file_line { 'updatehosts2':
  ensure  => present,
  path    => '/etc/updatehosts.sh',
  require => File_line['updatehosts1'],
  line    => '    cp /etc/HOSTSFunix.txt /etc/hosts',
}

file_line { 'updatehosts3':
  ensure  => present,
  path    => '/etc/updatehosts.sh',
  require => File_line['updatehosts2'],
  line    => 'else',
}

file_line { 'updatehosts4':
  ensure  => present,
  path    => '/etc/updatehosts.sh',
  require => File_line['updatehosts3'],
  line    => '    cp /etc/HOSTSMTWRunix.txt /etc/hosts',
}

file_line { 'updatehosts5':
  ensure  => present,
  path    => '/etc/updatehosts.sh',
  require => File_line['updatehosts4'],
  line    => 'fi',
}

cron { 'cronupdatehosts':
  ensure  => present,
  command => '/etc/updatehosts.sh',
  require => File['/etc/updatehosts.sh'],
  user    => 'root',
  special => 'reboot',
}
