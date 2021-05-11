class apache::app {
    file { '/var/www/vhost/index.html':
        ensure => file,
        owner  => root,
        group  => root,
        mode   => '755',
        source => 'puppet:///modules/apache/index.html',
        require => Class["apache::httpd"],
    }
}s