# installmodules.pp
# Michael McMahon

# based on zinovyev from http://stackoverflow.com/questions/16774980/can-i-install-puppet-modules-through-puppet-manifest

# PREREQUISITE: puppet agent
# To apply, run this command
# puppet apply init.pp

$module_stdlib = 'puppetlabs-stdlib'
exec { 'puppet_module_stdlib':
	command => "puppet module install ${module_stdlib}",
	unless  => "puppet module list | grep ${module_stdlib}",
	path    => ['/bin', '/opt/puppetlabs/bin', '/usr/bin']
}
