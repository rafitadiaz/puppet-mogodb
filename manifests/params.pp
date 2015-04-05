#
class mongodb::params {
  $config_template      = 'mongodb/mongodb.conf.erb'
  $dbpath               = '/var/lib/mongodb'
  $logpath              = '/var/log/mongodb/mongodb.log'
  $logappend            = true
  $bind_ip              = '127.0.0.1'
  $port                 = undef
  $journal              = true
  $default_package_name = ['mongodb']
  $default_service_name = 'mongodb'
  $package_ensure       = 'present'
  $service_enable       = true
  $service_ensure       = 'running'
  $default_config       = '/etc/mongodb.conf'  
}

