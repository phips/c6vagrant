## sysctl :: init.pp
#
### THIS FILE IS CENTRALLY MANAGED UNDER GIT! DO NOT EDIT LOCALLY! ###
###             CHECK THE FILE OUT FROM THE REPOSITORY             ###
#
# Class: sysctl
#
# This class does something. Tell us about it here!
# Currenty only supported on Linux (easy enough to expand)
#
# Parameters:
#   - $example_CHANGEME_!!
#     *EXAMPLE* Defined in hiera. Used in the sysctl.conf.erb template.
#
# Requires:
#   Nothing.
#
# Sample Usage:
#   class {'sysctl': }
#
class sysctl {
    # This isn't that important here, as there is only CentOS in use.
    case $::operatingsystem {
        'centos': {
            $supported = true
        }
        default: {
            $supported = false
            notify { "${module_name}_unsupported":
                message => "The ${module_name} module is not supported on ${::operatingsystem}",
            }
        }
    }

    if ( $supported == true ) {
        class { 'sysctl::common':
            enabled => hiera('sysctl_enabled', True)
        }
    }
}

# Footer - do not edit below here
# vim: set ft=puppet ts=4 sw=4 et tw=79:
