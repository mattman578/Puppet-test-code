class apache (
    $httpd_port = 8120
)
{
    default_vhost => false
    include apache::httpd
    include apache::app
}

apache::vhost { 'vhost.example.com':
    port => '80',
    docroot => '/var/www/vhost',
}