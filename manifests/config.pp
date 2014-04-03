class artifactory::config(
  $version      = '3.2.0',
  $destination  = '/opt',
  $user         = 'artifactory',
  $group        = 'artifactory',
  $port         = 8081,
  $manage_java  = true,
  $java_package = 'openjdk-7-jre',
) {

}