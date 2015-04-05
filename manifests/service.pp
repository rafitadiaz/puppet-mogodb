class mongodb::service inherits mongodb {

  if ! ($service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }
  
  service { 'mongodb':
    ensure     => $service_ensure,  
    enable     => $service_enable,  
    name       => $service_name,    
    hasstatus  => true,
    hasrestart => true,
  }
}