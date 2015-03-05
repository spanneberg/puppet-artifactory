puppet-artifactory
==================

Puppet module to setup Artifactory. Tested with Ubuntu Precise and Trusty and Artifactory 3.5.x

Customization of the installation can be handled with the artifactory::config class, e.g.

```
class { 'artifactory::config' :
  $version       => '3.2.0',
  $user          => 'artifact',
  $group         => 'artifact',
  $port          => 8082,
  $manage_java   => true,
  $java_package  => 'openjdk-7-jdk'
  $manage_war    => false,
  $war_location = '',
}

include artifactory
```
