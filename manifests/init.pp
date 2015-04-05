# == Class: mongodb
#
# Full description of class mongodb here.
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
#  class { mongodb:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class mongodb (
  $config_template = $mongodb::params::config_template,
  $dbpath          = $mongodb::params::dbpath,
  $logpath         = $mongodb::params::logpath,
  $logappend       = $mongodb::params::logappend,
  $bind_ip         = $mongodb::params::bind_ip,
  $port            = $mongodb::params::port,
  $journal         = $mongodb::params::journal,
  $service_enable  = $mongodb::params::service_enable,
  $service_ensure  = $mongodb::params::service_ensure,
  $service_name    = $mongodb::params::default_service_name,
  $config          = $mongodb::params::default_config  

) inherits mongodb::params {
  
  validate_absolute_path($config)
  validate_string($config_template)
  validate_string($dbpath)
  validate_absolute_path($logpath)
  validate_bool($logappend)
  validate_string($bind_ip)
  if $port { validate_integer($port) }
  validate_bool($journal)
  validate_bool($service_enable)  
  validate_string($service_ensure)
  validate_string($service_name)  
  
  anchor { 'mongodb::begin': } ->
  class { '::mongodb::install': } ->
  class { '::mongodb::config': } ~>
  class { '::mongodb::service': } ->
  anchor { 'mongodb::end': }

}
