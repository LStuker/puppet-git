# == Class: git
#
# This puppet module install git package
#
# === Parameters
#   [*ensure*]
#     Ensure if present or absent.
#     Default: present
#
#   [*autoupgrade*]
#     Upgrade package automatically, if there is a newer version.
#     Default: false
#
#   [*package*]
#     Name of the package.
#     Only set this, if your platform is not supported or you know,
#     what you're doing.
#     Default: auto-set, platform specific
#
# === Examples
#
#  class { git:
#  }
#
#  class { git:
#   autoupgrade => true,
#  }
#
# === Authors
#
# LStuker <lucien.stuker@gmail.com>
#
# === Copyright
#
# Copyright 2013 Lucien Stuker.
#
class git(
  $ensure              = 'present',
  $autoupgrade         = false,
  $package             = $git::params::package,
) inherits git::params {

    case $ensure {
    /(present)/: {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }
    }
    /(absent)/: {
      $package_ensure = 'absent'
    }
    default: {
      fail('ensure parameter must be present or absent')
    }
  }

  package { $package:
    ensure    => $package_ensure,
  }

}
