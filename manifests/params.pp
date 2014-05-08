# Class: git::params
#
#   The git configuration settings.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#

class git::params {
  case $::osfamily {
    redhat: {
      $package = 'git'
    }
    debian: {
      $package = 'git'
    }
    solaris: {
      case $::kernelrelease {
        '5.11': {
          $package = 'git'
        }
        '5.10': {
          $package          = 'CSWgit'
          $package_provider = 'pkgutil'
        }
      }
    }
    default: {
      warning("Module 'git' is not currently supported on ${::operatingsystem}")
    }
  }
}
