# Class artifactory::install
#
# Manages the download and installation of Artifactory
#
class artifactory::install inherits artifactory::config {

  Exec {
    path => '/bin:/usr/bin:/sbin:/usr/sbin'
  }

  $neededPackages = [ 'wget', 'unzip' ]
  $downloadFile   = "jfrog-artifactory-oss-${version}.zip"
  $downloadUrl    = "https://bintray.com/artifact/download/jfrog/artifactory/${downloadFile}"
  $downloadPath   = '/tmp'

  package { $neededPackages :
    ensure => installed,
  }

  if ( $manage_java ) {
    package { $java_package :
      ensure => installed,
    }
  }

  exec { "download-artifactory-${version}-archive-zip" :
    command => "wget ${downloadUrl}",
    cwd     => $downloadPath,
    creates => "${downloadPath}/${downloadFile}",
    onlyif  => "test ! -d ${destination}/artifactory-${version}",
    require => Package['wget'],
  }

  exec { "extract-artifactory-${version}-archive" :
    command => "unzip ${downloadFile} -d ${destination}",
    cwd     => $downloadPath,
    creates => "${destination}/artifactory-${version}",
    require => [ Package['unzip'], Exec["download-artifactory-${version}-archive-zip"] ],
  }

  # patch the broken installService.sh to allow changing the user
  file { "${destination}/artifactory-${version}/bin/installService.sh" : 
    source  => "puppet:///modules/${module_name}/installService.sh",
    require => Exec["extract-artifactory-${version}-archive"],
  }

  # update contents of included server.xml to allow changing the port
  file { "${destination}/artifactory-${version}/tomcat/conf/server.xml" : 
    content => template("${module_name}/server.xml.erb"),
    require => Exec["extract-artifactory-${version}-archive"],
  }

  group { $group :
    ensure => present,
  }
  
  user { $user : 
    ensure     => present,
    managehome => false,
    gid        => $group,
  }

  file { "${destination}/artifactory-${version}" :
    ensure  => present,
    owner   => $user,
    group   => $group,
    recurse => true,
    require => [ 
      Exec["extract-artifactory-${version}-archive"],
      User[$user],
      Group[$group],
    ]
  }

  exec { "run-artifactory-${version}-install-script" :
    command => "${destination}/artifactory-${version}/bin/installService.sh $user",
    creates => '/etc/init.d/artifactory',
    require => File["${destination}/artifactory-${version}"],
  }

}