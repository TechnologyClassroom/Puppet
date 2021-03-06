# ubuntu1604minworkstation.pp
# Michael McMahon
# A puppet manifest for configuring the lightweight Ubuntu Minimal 16.04.

# Ubuntu Minimal: https://help.ubuntu.com/community/Installation/MinimalCD

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

# A/V assists converting, editing, and playing audio and video media content.
$av = [ 'libav-tools', 'vlc', 'youtube-dl' ]
package { $av: ensure => 'installed' }

# Dev Tools assist building and configuring programs and systems.
$devtools = [ 'aptitude', 'cups', 'devscripts', 'dnsutils', 'git', 'gparted',
  'inotify-tools', 'lxterminal', 'numlockx', 'p7zip', 'qemu', 'rdesktop',
  'remmina', 'synaptic', 'tmux', 'x11-utils', 'xarchiver', 'xkbset' ]
package { $devtools: ensure => 'installed' }

# DE/WM provides Desktop Environments and Window Manager GUIs.
$dewm = [ 'awesome', 'lightdm', 'lxde-common', 'lxde-core', 'lxsession-logout' ]
package { $dewm: ensure => 'installed' }

# Fun provides unnecessary programs that make a GNU/Linux system silly.
$fun = [ 'fortune-mod', 'pi', 'rig', 'xaos' ]
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

# Python includes some useful python scripts.
$python = [ 'idle3', 'python-markdown', 'python-pygame', 'python3-pip' ]
package { $python: ensure => 'installed' }

# Text Editors include tools that help edit text.
$texteditors = [ 'calibre', 'leafpad', 'libreoffice', 'vim' ]
package { $texteditors: ensure => 'installed' }
