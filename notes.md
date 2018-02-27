# Useful weblinks

## Scripting puppet master agent setup
http://www.bogotobogo.com/DevOps/Puppet/puppet_setting_up_master_and_agent_with_scripts_EC2.php

## Puppet-agent download links
https://docs.puppet.com/puppet/4.5/reference/install_linux.html
https://docs.puppet.com/puppet/latest/reference/install_osx.html#download-the-os-x-puppet-agent-package
https://docs.puppet.com/puppet/4.5/reference/install_windows.html#download-the-windows-puppet-agent-package

## Classes and parameterized classes
https://docs.puppet.com/puppet/latest/reference/lang_classes.html

## Roles and Profiles
http://www.craigdunn.org/2012/05/239/
http://garylarizza.com/blog/2014/02/17/puppet-workflow-part-2/
https://docs.puppet.com/pe/latest/puppet_assign_configurations.html

## NTP module as an example of how a modules should be built
https://github.com/puppetlabs/puppetlabs-ntp

## Scheduled Tasks for Windows
https://docs.puppet.com/puppet/4.5/reference/type.html#scheduledtask
cd "Program Files\Puppet Labs\Puppet\bin
puppet.bat resource scheduled_task

## Boilerplates
https://github.com/example42/Example42-templates

## Services on GNU/Linux and Mac
https://docs.puppet.com/puppet/latest/reference/types/service.html

## Launchd (Mac)
https://docs.puppet.com/puppet/latest/reference/types/service.html#service-provider-launchd
https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/Introduction.html

## Systemd
https://docs.puppet.com/puppet/latest/reference/types/service.html#service-provider-systemd

## Cron
https://docs.puppet.com/puppet/latest/reference/type.html#cron
http://stackoverflow.com/questions/22552520/cron-job-not-running-created-by-puppet

Arch does not come with cron.  To install use, sudo pacman -Sy cronie.  To start the service, run sudo systemctl enable cronie.service.

## Copy files from agent to master
https://ask.puppet.com/question/1931/how-can-i-copy-client-files-to-a-puppet-master/

## Run bash script example
https://ask.puppet.com/question/13844/how-to-deploy-bash-scripts-using-puppet/

## file_line
https://forge.puppet.com/puppetlabs/stdlib/types

## Gepetto IDE
https://github.com/puppetlabs/geppetto

## librarian-puppet for managing modules
http://librarian-puppet.com/
sudo gem install librarian-puppet

## puppet-lint for cleaning manifest

```
http://puppet-lint.com/
package { 'puppet-lint':
  ensure   => '1.1.0',
  provider => 'gem',
}
```

```
sudo gem install puppet-lint
puppet-lint --fix /etc/puppet/modules
```

```
service { 'resource title':
  name       => # (namevar) The name of the service to run.  This name is...
  ensure     => # Whether a service should be running.  Valid...
  binary     => # The path to the daemon.  This is only used for...
  control    => # The control variable used to manage services...
  enable     => # Whether a service should be enabled to start at...
  flags      => # Specify a string of flags to pass to the startup 
  hasrestart => # Specify that an init script has a `restart...
  hasstatus  => # Declare whether the service's init script has a...
  manifest   => # Specify a command to config a service, or a path 
  path       => # The search path for finding init scripts....
  pattern    => # The pattern to search for in the process table...
  restart    => # Specify a *restart* command manually.  If left...
  start      => # Specify a *start* command manually.  Most...
  status     => # Specify a *status* command manually.  This...
  stop       => # Specify a *stop* command...
  # ...plus any applicable metaparameters.
}

service { "updatehosts":
    ensure => running,
    enable => true,
    require => File["/etc/updatehosts.sh"],
    #provider => systemd,
    provider => launchd,
}
```

## Install file_line

```
sudo puppet module install puppetlabs-stdlib
su Computer\ Clubhouse -c sudo\ /opt/puppetlabs/bin/puppet\ module\ install\ puppetlabs-stdlib
```

## Run puppet agent masterless for testing

```sudo /opt/puppetlabs/bin/puppet apply /Users/bluehill/Downloads/Puppet-master/OSXhosts.pp```

## Run puppet agent masterless for testing complete

```
curl -o puppet-agent-1.5.2-1.osx10.9.dmg https://downloads.puppetlabs.com/mac/10.9/PC1/x86_64/puppet-agent-1.5.2-1.osx10.9.dmg
open puppet-agent-1.5.2-1.osx10.9.dmg
su Computer\ Clubhouse -c sudo\ /opt/puppetlabs/bin/puppet\ module\ install\ puppetlabs-stdlib
curl -o Puppet-master.zip https://github.com/BlueHillBGCB/Puppet/archive/master.zip
unzip Puppet-master.zip
su Computer\ Clubhouse -c sudo\ /opt/puppetlabs/bin/puppet\ apply\ /Users/bluehill/Downloads/Puppet-master/init.pp
```



## Useful commands

## List useful help on a resource

```
puppet describe scheduled_task | less
puppet describe user | less
```

## Inspect resource

```puppet resource user root```

## Execute a piece of puppet code with -e switch

```puppet apply -e "user { 'bluehill': ensure => present, }"```

## Edit a resource in a text editor and apply immediately

```puppet resource -e user galatea```




## Manifest code snippets

```
file { '/etc/updatehosts.sh':
  ensure => present,
}

# DEBUG
file_line { 'DEBUG':
  path    => '/etc/updatehosts.sh',
  ensure  => present,
  require => File['/etc/updatehosts.sh'],
  line    => 'echo test > /etc/debug.txt',
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
  weekday     => '0-4',
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
  weekday     => '0-4',
}

cron { 'CopyHOSTSFunix':
  ensure      => present,
  command     => 'sh /etc/HOSTSFunixLScp.sh',
  require => File_line ['cpHOSTSFunixLS'],
  user        => 'root',
  weekday     => '5',
}
```


## Firefox modules
https://github.com/nibalizer/puppet-module-firefox
https://github.com/simp/pupmod-simp-mozilla
