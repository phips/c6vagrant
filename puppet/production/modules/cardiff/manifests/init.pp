# == Class: cardiff
#
# Full description of class cardiff here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { cardiff:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class cardiff {
    package { 'httpd':
        ensure => 'installed',
    }

    exec { 'create_app_path':
        path    => '/bin:/usr/bin',
        command => 'mkdir -p /srv/www/flask_app',
        creates => '/srv/www/flask_app',
    }

    git::repo { 'webapp':
        path   => '/srv/www/flask_app',
        source => 'file:///vagrant/app.git'
    }

    file { '/etc/httpd/conf.d/app.conf':
        source  => 'puppet:///modules/cardiff/app.conf',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => Package['httpd'],
    }

    file { 'appsvc':
        path    => '/etc/init.d/cardiff',
        source  => 'puppet:///modules/cardiff/cardiff.init',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => Git::Repo['webapp'],
    }

    # yes, awful, I know
    exec { 'startapp':
        command => '/sbin/service cardiff start',
        path    => '/usr/bin',
        unless  => 'pgrep -l app.py',
        require => File['appsvc'],
        notify  => Service['httpd'],
    }

    service { 'httpd':
        ensure  => 'running',
        enable  => true,
        require => Package['httpd'],
    }
}
