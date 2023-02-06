node default{

	package { 'nginx':
		ensure=> 'installed',
	}
	
	file {'/tmp/status.txt':
		content => 'Nginx Installed',
		mode => '0644',
	}
}
