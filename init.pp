# init.pp
# Michael McMahon
# This file configures HOSTS to rotate between the files in https://github.com/TechnologyClassroom/HOSTS for GNU/Linux systems

# PREREQUISITE: puppet agent
# To apply, run this command
# puppet apply init.pp
# To install requisites, install UbuntuMinimal and run these commands:
# sudo apt-get update
# sudo apt-get install -y puppet
# sudo puppet apply ubuntumin.pp

$module_stdlib = 'puppetlabs-stdlib'
exec { 'puppet_module_stdlib':
	command => "puppet module install ${module_stdlib}",
	unless  => "puppet module list | grep ${module_stdlib}",
	path    => ['/bin', '/opt/puppetlabs/bin', '/usr/bin']
} # based on zinovyev from http://stackoverflow.com/questions/16774980/can-i-install-puppet-modules-through-puppet-manifest

file { '/etc/updatehosts.sh':
  ensure => present,
  require => exec['puppet_module_stdlib'],
  mode   => '0755',
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
  special => 'reboot',
}
