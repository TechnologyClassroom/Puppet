# Run this command with sh mac10.9setup.sh
curl -o puppet-agent-1.5.2-1.osx10.9.dmg https://downloads.puppetlabs.com/mac/10.9/PC1/x86_64/puppet-agent-1.5.2-1.osx10.9.dmg
open puppet-agent-1.5.2-1.osx10.9.dmg
su Computer\ Clubhouse -c sudo\ puppet\ module\ install\ puppetlabs/stdlib
su Computer\ Clubhouse -c sudo\ puppet\ agent\ --waitforcert\ 60
