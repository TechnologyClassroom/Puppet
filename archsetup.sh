# archsetup.sh
# Michael McMahon

# This script installs and applies a puppet manifest for Arch Linux.

# Install cron, git, and puppet
sudo pacman -Sy cronie git puppet

# Enable cron service in systemd
sudo systemctl enable cronie.service

# Install stdlib module
sudo puppet module install puppetlabs/stdlib

# If not using this github already, uncomment to pull from github
#mkdir builds && cd builds
#git clone https://github.com/BlueHillBGCB/puppet.git
#cd puppet

sudo puppet apply init.pp
