# ubuntumin.pp
# Michael McMahon

# To apply, run this command
# puppet apply archsetup.pp
# To install requisites, install UbuntuMinimal and run these commands:
# sudo apt-get update
# sudo apt-get install -y puppet
# sudo puppet apply ubuntumin.pp

# Basic usage format
#package { 'packagename':
#	ensure => installed,
#}

# Replace 'noob' with your username.  This is required for startx to work.
#file { '/home/noob/.xinitrc':
#	ensure => present,
#	require => Package['awesome'],
#	content => 'exec awesome',
#}

$asciiart = [ 'aview', 'bb', 'caca-utils', 'figlet', 'libaa-bin', 'sl', 'toilet', 'xaos' ]
package { $asciiart: ensure => 'installed' }

$avtools = [ 'libav-tools', 'vlc', 'youtube-dl' ]
package { $avtools: ensure => 'installed' }

$devtools = [ 'devscripts', 'dnsutils', 'git', 'p7zip', 'synaptic', 'xarchiver' ]
package { $devtools: ensure => 'installed' }

$DEWM = [ 'awesome', 'lxde-core' ]
package { $DEWM: ensure => 'installed' }

$fun = [ 'bsdgames', 'cowsay', 'fortune-mod', 'mandelbulber', 'nethack-console', 'ninvaders', 'pi', 'python-renpy', 'renpy' ]
package { $fun: ensure => 'installed' }

$graphics = [ 'feh', 'fontforge', 'gimp', 'icc-profiles-free', 'imagemagick', 'inkscape', 'xfonts-100dpi' ]
package { $graphics: ensure => 'installed' }

$Internet = [ 'curl', 'firefox', 'midori', 'nmap', 'w3m', 'wicd' ]
package { $Internet: ensure => 'installed' }

$phonedev = [ 'android-tools-adb', 'android-tools-fastboot', 'ubuntu-sdk' ]
package { $phonedev: ensure => 'installed' }

$python = [ 'idle-python2.7', 'python-pygame', 'python-pip' ]
package { $python: ensure => 'installed' }

$texteditors = [ 'leafpad', 'libreoffice', 'sphinx-doc' ]
package { $texteditors: ensure => 'installed' }

$webserver = [ 'nginx', 'nodejs', 'npm', 'php', 'sqlite' ]
package { $webserver: ensure => 'installed' }
