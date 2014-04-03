class artifactory::service {

  service { 'artifactory' :
    ensure  => running,
    require => Class[artifactory::install],
  }

}