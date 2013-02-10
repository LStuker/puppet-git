# == Class: git
#
# This puppet module install git package
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { git:
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
class git() inherits git::params {

  package { 'git':
    name      => $git_package_name,
    ensure    => $ensure,
  }

}
