$html_path = '/usr/share/nginx/actestsite.com'
$epp_source_path = '/etc/puppetlabs/code/environments/production/files'
$default_sblock_path = '/etc/puppetlabs/code/environments/production/templates'


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

	file {"${html_path}":
		ensure => "directory",
		owner => 'root',
		group => 'root',
		mode => '0777',
	}

	file {"${html_path}/index.html":
		ensure => "file",
		owner => 'root',
		group => 'root',
		mode => '0777',
		content => epp("${epp_source_path}/index.html.epp"),
	}

	file {'/etc/nginx/conf.d/actestsite.com.conf':
		ensure => "file",
		owner => 'root',
		group => 'root',
		mode => '0755',
		content => epp("${epp_source_path}/actestsite.com.conf.epp"),
	}

	file {"/etc/hosts":
		content => epp("${epp_source_path}/hosts.epp"),
	}

	file {"/etc/nginx/nginx.conf":
		content => epp("${default_sblock_path}/nginx.conf.epp"),
		notify =>Service["nginx"],
	}
}
