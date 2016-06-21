# Run this command with sh mac10.11setup.sh
curl -o puppet-agent-1.5.2-1.osx10.11.dmg https://downloads.puppetlabs.com/mac/10.11/PC1/x86_64/puppet-agent-1.5.2-1.osx10.11.dmg
open puppet-agent-1.5.2-1.osx10.11.dmg
su Computer\ Clubhouse -c sudo\ puppet\ module\ install\ puppetlabs/stdlib
