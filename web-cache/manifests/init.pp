class web-cache {
	exec { 'apt-update':
		command => '/usr/bin/apt-get update'
	}
	package { 'memcached':
		require => Exec['apt-update'],
		ensure => installed,
	}
	service { 'memcached': 
		ensure => running,
	}
}
