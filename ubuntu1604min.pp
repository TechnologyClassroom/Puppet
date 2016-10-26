# ubuntumin.pp
# Michael McMahon
# A puppet manifest for configuring the lightweight Ubuntu Minimal 16.04.

# Ubuntu Minimal: https://help.ubuntu.com/community/Installation/MinimalCD

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

# ASCII art is generative art using characters instead of pixels.
$asciiart = [ 'aview', 'bb', 'caca-utils', 'figlet', 'libaa-bin', 'sl', 'toilet' ]
package { $asciiart: ensure => 'installed' }

# A/V tools assist converting, editing, and playing audio and video media content.
$avtools = [ 'libav-tools', 'vlc', 'youtube-dl' ]
package { $avtools: ensure => 'installed' }

# ComputerVision includes tools to program how a computer sees.
#$computervision = [ 'opencv-data', 'opencv-doc', 'python-opencv' ]
#package { $computervision: ensure => 'installed' }

# Dev tools assist building and configuring programs and systems.
$devtools = [ 'devscripts', 'dnsutils', 'git', 'p7zip', 'synaptic', 'xarchiver', 'xev' ]
package { $devtools: ensure => 'installed' }

# DE/WM provide Desktop Environments and Window Manager Graphical User Interfaces.
$DEWM = [ 'awesome', 'lxde-core' ]
package { $DEWM: ensure => 'installed' }

# Fun provides unnecessary programs that make a GNU/Linux system silly.
$fun = [ 'bsdgames', 'cowsay', 'fortune-mod', 'mandelbulber', 'nethack-console', 'ninvaders', 'pi', 'python-renpy', 'renpy', 'xaos' ]
package { $fun: ensure => 'installed' }

# Graphic includes tools that view and edit pictures for graphic design.
$graphic = [ 'feh', 'fontforge', 'gimp', 'icc-profiles-free', 'imagemagick', 'inkscape', 'krita', 'xfonts-100dpi' ]
package { $graphic: ensure => 'installed' }

# Internet includes tools that assist with the World Wide Web.
$Internet = [ 'aria2', 'curl', 'firefox', 'links2', 'midori', 'nmap', 'w3m', 'wicd' ]
package { $Internet: ensure => 'installed' }

# Phone dev includes tools that assist with Android and Ubuntu Touch.
$phonedev = [ 'android-tools-adb', 'android-tools-fastboot', 'ubuntu-sdk' ]
package { $phonedev: ensure => 'installed' }

# Python includes some useful python scripts.
$python = [ 'idle-python2.7', 'python-markdown', 'python-pygame', 'python-pip' ]
package { $python: ensure => 'installed' }

# Text editors include tools that help edit text.  Vi and nano are already included.
$texteditors = [ 'calibre', 'leafpad', 'libreoffice', 'python-sphinx', 'sphinx-doc' ]
package { $texteditors: ensure => 'installed' }

# Web Server includes tools to run a local web server on your system.  With added sec and configuration, you could eliminate the need for hosting.
$webserver = [ 'nginx', 'nodejs', 'npm', 'php', 'sqlite' ]
package { $webserver: ensure => 'installed' }
