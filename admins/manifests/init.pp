class admins {
	group { 'webadmins':
		ensure => present,
		gid => $uid,
	}

	group { 'sudo':
		ensure => present,
		gid => '27',
	}

	user { 'tom' :
		ensure => present,
		uid => $uid,
		gid => '27',
		groups => [ 'webadmins' ],
		password => 'tommy',
	}
 	
	user { 'brady' :
 		ensure => present,
 		uid => $uid,
 		gid => '27',
 		groups => [ 'webadmins' ],
 		password => 'brandy',
 	}
 
	user { 'janet' :
 		ensure => present,
 		uid => $uid,
 		gid => '27',
		groups => [ 'webadmins' ],
 		password => 'janet',
 	}


	file {'/etc/motd':
		ensure => file,
		mode => '0644',
		content => "This VM is set up and managed by Ice AS.This VMs IP address is ${ipaddress}, Hostname ${fqdn}. Running ${operatingsystem} ${operatingsystemrelease} and Puppet ${puppetversion}.",
	}

}
