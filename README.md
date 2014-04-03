puppet-artifactory
==================

Puppet module to setup Artifactory. Tested with Ubuntu Precise and Artifactory 3.2.0.

Customization of the installation can be handled with the artifactory::config class, e.g.

```
class { 'artifactory::config' :
  version       => '3.2.0',
  user          => 'artifact',
  group         => 'artifact',
  port          => 8082,
  manage_java   => true,
  java_package  => 'openjdk-7-jdk'
}

include artifactory
```
