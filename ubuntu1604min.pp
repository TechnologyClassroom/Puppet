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

# Replace 'user' with your username.  This is required for startx to work.
#file { '/home/user/.xinitrc':
#	ensure => present,
#	require => Package['awesome'],
#	content => 'exec awesome',
#}

# ASCII Art is generative art using characters instead of pixels.
$asciiart = [ 'aview', 'bb', 'caca-utils', 'figlet', 'libaa-bin', 'sl',
  'toilet' ]
package { $asciiart: ensure => 'installed' }

# A/V assists converting, editing, and playing audio and video media content.
$av = [ 'audacity', 'blender', 'flowblade', 'kdenlive', 'libav-tools',
  'libimage-exiftool-perl', 'ubuntustudio-video', 'vlc', 'youtube-dl' ]
package { $av: ensure => 'installed' }

# ComputerVision includes tools to program how a computer sees.
#$computervision = [ 'opencv-data', 'opencv-doc', 'python-opencv' ]
#package { $computervision: ensure => 'installed' }

# Dev Tools assist building and configuring programs and systems.
$devtools = [ 'aptitude', 'cfengine3', 'cups', 'devscripts', 'dnsutils', 'git',
  'gparted', 'inotify-tools', 'lxterminal', 'macchanger', 'numlockx', 'p7zip',
  'qemu', 'rdesktop', 'remmina', 'synaptic', 'terminator', 'terminology',
  'tmux', 'x11-utils', 'xarchiver', 'xkbset' ]
package { $devtools: ensure => 'installed' }

# DE/WM provides Desktop Environments and Window Manager GUIs.
$dewm = [ 'awesome', 'lightdm', 'lxde-common', 'lxde-core', 'lxsession-logout' ]
package { $dewm: ensure => 'installed' }

# Fun provides unnecessary programs that make a GNU/Linux system silly.
$fun = [ 'bsdgames', 'cmus', 'cowsay', 'fortune-mod', 'mandelbulber',
  'nethack-console', 'ninvaders', 'pi', 'python-renpy', 'renpy', 'rig', 'xaos' ]
package { $fun: ensure => 'installed' }

# Graphic includes tools that view and edit pictures for graphic design.
$graphic = [ 'feh', 'fontforge', 'gimp', 'icc-profiles-free', 'imagemagick',
  'inkscape', 'krita', 'xfonts-100dpi' ]
package { $graphic: ensure => 'installed' }

# Internet includes tools that assist with the Internet.
$internet = [ 'aria2', 'curl', 'firefox', 'links2', 'midori', 'network-manager',
  'nmap', 'thunderbird', 'w3m' ]
package { $internet: ensure => 'installed' }
# If you want more control with less ease-of-use with networking, replace
# network-manager with wicd.

# Phone Dev includes tools that assist with Android and Ubuntu Touch.
$phonedev = [ 'android-tools-adb', 'android-tools-fastboot', 'fastboot' ]
package { $phonedev: ensure => 'installed' }
$phonepur = [ 'ubuntu-sdk' ]
package { $phonepur: ensure => 'purged' }

# Python includes some useful python scripts.
$python = [ 'idle3', 'python-markdown', 'python-pygame', 'python3-pip' ]
package { $python: ensure => 'installed' }

# Text Editors include tools that help edit text.
$texteditors = [ 'calibre', 'gedit', 'leafpad', 'libreoffice', 'notepadqq',
  'python3-sphinx', 'vim' ]
package { $texteditors: ensure => 'installed' }

# Web Server includes tools to run a local web server on your system.
# With added sec and configuration, you could eliminate the need for hosting.
$webserver = [ 'nginx', 'nodejs', 'npm', 'php', 'sqlite' ]
package { $webserver: ensure => 'installed' }
# nagios3 nagstamon
