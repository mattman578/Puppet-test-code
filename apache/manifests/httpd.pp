class apache::httpd {
    package { 'httpd':
        ensure => installed,
    }
    service { "httpd":
        ensure     => running,
        enable     => true,
        require    => Package["httpd"],
        hasrestart => true,
        hasstatus  => true,
        # pattern    => 'httpd',
    }
    file { '/etc/httpd/conf.d/vhost.conf':
        notify => Service["httpd"],
        ensure => file,
        require => Package["httpd"],
        content => template("apache/vhost.conf.erb"),
    }
    file { "/var/www/vhost":
        ensure => "directory",
    }
}