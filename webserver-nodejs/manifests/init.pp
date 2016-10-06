class webserver-nodejs { 
	exec { 'apt-update':
		command => '/usr/bin/apt-get update'
	}
	
	package { 'nodejs': require => Exec['apt-update'],
		ensure => installed,
	}

	service { 'nodejs': 
		ensure => running,
	}
}
