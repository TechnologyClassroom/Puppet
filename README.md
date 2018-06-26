# Puppet

My puppet configs and scripts for initial setup and configuration management of
educational systems.

Michael McMahon

[Puppet](https://puppet.com/) is a
[DevOps](https://en.wikipedia.org/wiki/DevOps) tool that uses
[declaritive programming](https://en.wikipedia.org/wiki/Declarative_programming)
to manage configurations on systems without saying how they should get to that
point.  Puppet takes care of the middle steps.

Puppet Manifests:

- init.pp can install a cronjob and update the hosts files for GNU/Linux, Mac,
  and Unix.  It requires cron, puppet, and stdlib module.
- installmodules.pp installs the stdlib puppet module.
- ubuntu1604min.pp configures packages for Ubuntu Minimal 16.04.
- ubuntu1604minworkstation.pp configures a workstation for Ubuntu Minimal 16.04.

Bash helper scripts:

- archsetup.sh helps install puppet and stdlib for Arch Linux.
- installmodules.sh installs stdlib.
- macXX.XXsetup.sh files help install puppet and stdlib for Mac systems.

## Bolt

Bolt is a newer agent-less configuration management tool complementing puppet.

### Installing bolt on Ubuntu 16.04

```
sudo apt update
sudo apt install -y ruby-dev
sudo gem install bolt
```

### Configuring bolt.yml

Edit the ```~/.puppetlabs/bolt.yml``` file.

```
---
modulepath: "~/.puppetlabs/bolt-code/site:~/.puppetlabs/bolt-code/modules"
concurrency: 10
format: human
log:
  console:
    level: warn
  ~/.puppetlabs/bolt/debug.log:
    level: debug
    append: false
ssh:
  host-key-check: false
  private-key: ~/.ssh/id_rsa
```

### Hello World

Receive the hostname from a node.

```
bolt command run hostname --nodes root@10.12.17.16
```
