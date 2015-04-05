class mongodb::install inherits mongodb {

  package { 'mongodb':
    ensure => $package_ensure,
  }

}
