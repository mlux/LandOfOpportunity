

$epp_source_path = '/etc/puppetlabs/code/environments/production/files'
$default_sblock_path = '/etc/puppetlabs/code/environments/production/templates'
$vhost = 'www.anothertestsite.com'
$doc_root = '/usr/share/nginx'
#$doc_root = '/var/www/html'
#$create_dirs = ['/var/','/var/www/',"${doc_root}"]


node puppet.target.com {

	# This creates the directory path for $doc_root if needed
#	file {$create_dirs:
#		ensure => "directory",
#		owner => 'root',
#		group => 'root',
#		mode => '0777',
#	}

	# This function installs the nginx package
	package {'nginx':
		ensure => 'installed',
	}
	
	# Creates a status.txt file to include the content "Nginx Installed"
	file {'/tmp/status.txt':
		content => 'Nginx Installed',
		mode => '0644',
	}
	
	# Defines the service "nginx" and verifies it is running and enabled
	service {"nginx":
		ensure => 'running',
		enable => true,
	}
	
	# This defines the directory path for where we are going to store our html code
	file {"${doc_root}/${vhost}":
		ensure => "directory",
		owner => 'root',
		group => 'root',
		mode => '0777',
	}
	
	# This creates the file "index.html" and populates it with the contents found 	in our specified epp file
	file {"${doc_root}/${vhost}/index.html":
		ensure => "file",
		owner => 'root',
		group => 'root',
		mode => '0777',
		content => epp("${epp_source_path}/index.html.epp"),
	}
	
	# This creates our website .conf file and populates it using the contents found in our specified epp file
	file {"/etc/nginx/conf.d/actestsite.com.conf":
		ensure => "file",
		owner => 'root',
		group => 'root',
		mode => '0755',
		content => epp("${epp_source_path}/actestsite.com.conf.epp"),
	}
	
	# This updates the "hosts" file to include the contents found in our specified epp file
	file {"/etc/hosts":
		content => epp("${epp_source_path}/hosts.epp"),
	}
	
	# This updates the default nginx.conf file using a specified epp file and notifies the service "nginx" to restart
	file {"/etc/nginx/nginx.conf":
		content => epp("${default_sblock_path}/nginx.conf.epp"),
		notify =>Service["nginx"],
	}
}
