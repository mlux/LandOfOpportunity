node puppet.target.com {
	package {'nginx':
		ensure => 'installed',
	}

	file {'/tmp/status.txt':
		content => 'Nginx Installed',
		mode => '0644',
	}

	service {"nginx":
		ensure => 'running',
		enable => true,
	}

	file {'/usr/share/nginx/actestsite.com':
		ensure => "directory",
		owner => 'root',
		group => 'root',
		mode => '0777',
	}

	file {'/usr/share/nginx/actestsite.com/index.html':
		ensure => "file",
		owner => 'root',
		group => 'root',
		mode => '0777',
		content => epp('/etc/puppetlabs/code/environments/production/files/index.html.epp'),
	}

	file {'/etc/nginx/conf.d/actestsite.com.conf':
		ensure => "file",
		owner => 'root',
		group => 'root',
		mode => '0755',
		content => epp('/etc/puppetlabs/code/environments/production/files/actestsite.com.conf.epp'),
	}

	file {"/etc/hosts":
		content => epp("/etc/puppetlabs/code/environments/production/files/hosts.epp"),
	}

	file {"/etc/nginx/nginx.conf":
		content => epp("/etc/puppetlabs/code/environments/production/templates/nginx.conf.epp"),
		notify =>Service["nginx"],
	}
}
