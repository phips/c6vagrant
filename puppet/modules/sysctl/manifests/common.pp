## sysctl :: common.pp
#
### THIS FILE IS CENTRALLY MANAGED UNDER GIT! DO NOT EDIT LOCALLY! ###
###             CHECK THE FILE OUT FROM THE REPOSITORY             ###
#
class sysctl::common (
    $enabled = True,
) {
    if ! ( $enabled ) {
        notify { "${module_name}_disabled":
            message => "Module ${module_name} has been disabled for this host"
        }
    }
    else {
        file { '/var/core':
            ensure => 'directory',
            owner  => 'root',
            group  => 'root',
            mode   => '1777',
        }

        file { '01-core.conf':
            path    => '/etc/security/limits.d/01-core.conf',
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            content => "* soft core unlimited\n",
        }

        Sysctl { provider => 'augeas' }

        sysctl { 'kernel.core_pattern':
            ensure  => present,
            value   => '/var/core/core.%p.%e.%u.%s',
            comment => 'core file creation path/pattern',
            require => File[ [ '/var/core', '01-core.conf' ] ],
        }

        $absent = [ 'net.bridge.bridge-nf-call-ip6tables', 'net.bridge.bridge-nf-call-iptables', 'net.bridge.bridge-nf-call-arptables' ]

        sysctl { $absent:
            ensure => 'absent',
        }

        exec { 'refresh_sysctl':
            path        => '/sbin',
            command     => 'sysctl -p',
            refreshonly => true,
            subscribe   => Sysctl[ [ 'kernel.core_pattern', $absent ] ],
        }
    }
}

# Footer - do not edit below here
# vim: set ft=puppet ts=4 sw=4 et tw=79:
