class webserver-apache2 {
	exec { 'apt-update':
		command => '/usr/bin/apt-get update'
	}

	package { 'apache2':
		require => Exec['apt-update'],
		ensure => installed,
	}

	service { 'apache2':
		ensure => running,
	}

	package { 'php5':
		require => Exec['apt-update'],
		ensure => installed,
	}

	file { '/var/www/html/info.php':
		ensure => file,
		content => '<?php phpinfo(); ?>',
		require => Package['apache2'],
	}

	package { 'php5-mysql': 
		ensure => installed,
	}
}
