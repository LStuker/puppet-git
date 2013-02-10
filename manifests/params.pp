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
    'redhat','debian': {
      $git_package_name = 'git'
    }
    default: {
      fail("Module 'git' is not currently supported on ${::operatingsystem}")
    }
  }
}
