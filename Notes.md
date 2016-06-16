Using facter, I can find variables for systems.

GNU/Linux Ubuntu / Ubuntu Touch
os => {
	family => "Debian",
	name => "Ubuntu",
	release => {
		full => "16.04",
		major => "16.04",
	}
}

Mac OS X Mavericks
os => {
	family => "Darwin",
	macosx => {
		product => "Mac OS X",
		version => {
			full => "10.9.5",
			major => "10.9",
			minor => "5:
		)
	}
	name => "Darwin",
	release => {
		full => "13.4.0",
		major => "13",
		minor => "4",
	}
}

Windows 7
os => {
	name	=> "windows"
	family	=> "windows"
	release => {
		major => "7"
		full =>"7"
		}
	}
	
Windows 8.1
os => {
	family => "windows",
	name => "windows",
	release => {
		full => "8.1",
		major => "8.1"
	}
}


su Computer\ Clubhouse -c sudo\ /opt/puppetlabs/bin/puppet\ apply\ /Users/bluehill/Downloads/Puppet-master/OSXhosts.pp

# Useful weblinks

https://ask.puppet.com/question/1931/how-can-i-copy-client-files-to-a-puppet-master/

https://forge.puppet.com/puppetlabs/stdlib/types

# Classes and parameterized classes
https://docs.puppet.com/puppet/latest/reference/lang_classes.html

# Scheduled Tasks for Windows
https://docs.puppet.com/puppet/4.5/reference/type.html#scheduledtask

# Gepetto IDE
https://github.com/puppetlabs/geppetto

# Boilerplates
https://github.com/example42/Example42-templates

# Scheduling tasks on GNU/Linux and Mac
https://docs.puppet.com/puppet/latest/reference/types/service.html

# Launchd (Mac)
https://docs.puppet.com/puppet/latest/reference/types/service.html#service-provider-launchd
https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/Introduction.html

# Systemd
https://docs.puppet.com/puppet/latest/reference/types/service.html#service-provider-systemd

# Cron
https://docs.puppet.com/puppet/latest/reference/type.html#cron

cron { 'resource title':
  ensure      => present
  command     => 'sh /etc/updatehosts.sh'
  environment => # Any environment settings associated with this...
  hour        => # The hour at which to run the cron job. Optional; 
  minute      => # The minute at which to run the cron job...
  month       => # The month of the year.  Optional; if specified...
  monthday    => # The day of the month on which to run the...
  provider    => # The specific backend to use for this `cron...
  special     => # A special value such as 'reboot' or 'annually'...
  target      => # The name of the crontab file in which the cron...
  user        => # The user who owns the cron job.  This user must...
  weekday     => '0-4,6'
}

# Install file_line
sudo puppet module install puppetlabs-stdlib

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

file_line { 'cpHOSTSFunix':
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

cron { 'CopyHOSTSMTWRunix':
  ensure      => present,
  command     => 'sh /etc/HOSTSMTWRunixcp.sh',
  require => File_line ['cpHOSTSMTWRunix'],
  user        => 'root',
  weekday     => '0,1,2,3,4,6',
}

cron { 'CopyHOSTSFunix':
  ensure      => present,
  command     => 'sh /etc/HOSTSFunixcp.sh',
  require => File_line ['cpHOSTSFunix'],
  user        => 'root',
  weekday     => '5',
}

cron { 'CopyHOSTSMTWRunixLS':
  ensure      => present,
  command     => 'sh /etc/HOSTSMTWRunixLScp.sh',
  require => File_line ['cpHOSTSMTWRunixLS'],
  user        => 'root',
  weekday     => '0,1,2,3,4,6',
}

cron { 'CopyHOSTSFunix':
  ensure      => present,
  command     => 'sh /etc/HOSTSFunixLScp.sh',
  require => File_line ['cpHOSTSFunixLS'],
  user        => 'root',
  weekday     => '5',
}
