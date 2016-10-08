class db-server {
	exec { 'apt-update':
		command => '/usr/bin/apt-get update'
	}

	package { 'mysql-server':
		require => Exec['apt-update'],
		ensure => installed,
	}

	file { '/etc/my.cnf':
		ensure => file,
		mode => '0644',
		content => '[mysqld]
		log-bin=mysql-bin
		expire-logs-days=14
		max-binlog-size=500M',
	}
}
