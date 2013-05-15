# simple apache based web server with php and mysql

include augeasproviders
include sysctl

# defaults
Exec        { path => '/usr/sbin:/sbin:/bin:/usr/bin' }
Sshd_config { notify => Service[ 'sshd' ] }
User        { managehome => true }

$packages = [ 'httpd', 'mysql-server', 'php', 'php-mysql', 'php-pear' ]

package { $packages:
    ensure => installed,
}

file { '/etc/profile.d/aliases.sh':
    owner  => 'root', group => 'root', mode => '0644',
    source => 'puppet:///modules/configs/aliases.sh',
    tag    => 'setup',
}

service { 'sshd':
    ensure => 'running',
    enable => 'true',
}

service { 'httpd':
    ensure  => 'running',
    enable  => true,
    require => Package[ [ 'httpd', 'php' ] ],
}

# sshd config
#
sshd_config { 'LoginGraceTime':
    value  => '30s',
}

sshd_config { 'AllowTcpForwarding':
    value => 'yes',
}

sshd_config { 'PermitRootLogin':
    value  => 'yes',
}

sshd_config { 'AllowUsers':
    value  => [ 'root', 'vagrant' ],
}

sshd_config { 'MaxAuthTries':
    value  => '3',
}

sshd_config { 'PasswordAuthentication':
    value  => 'yes',
}

# Setup sudo
file { 'sudo_wheel':
    tag     => 'setup',
    path    => '/etc/sudoers.d/99_wheel',
    owner   => 'root', group => 'root', mode => '0440',
    content => "%wheel ALL = (ALL) ALL\n",
}

augeas { 'sudo_include_dir':
    tag     => 'setup',
    context => '/files/etc/sudoers',
    changes => 'set #includedir "/etc/sudoers.d"',
}

# make 'service httpd ...' work properly
file { '/etc/sysconfig/httpd':
    owner   => 'root', group => 'root', mode => '0644',
    content => "PIDFILE=/var/run/httpd/httpd.pid\nDAEMON_COREFILE_LIMIT=unlimited\n",
    require => Package[ 'httpd' ],
}

