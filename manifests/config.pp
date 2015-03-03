# Class: artifactory::config
#
# Parameters:
#
# version = '3.2.0' (default)
#   The Artifactory version to download and install
#
# destination = '/opt' (default)
#   The directory where Artifactory should be installed.
#   This directory will not be checked for existence.
#
# user = 'artifactory' (default)
#   The user under which Artifactory will be running.
#
# group = 'artifactory' (default)
#   The given users primary group.
#
# port = 8081 (default)
#   The port under which Artifactory will be accesible
#
# manage_java = true (default)
#   Wether the module should also install a Java runtime or not.
#   The package given in $java_package will be installed if this is true.
#
# java_package = 'openjdk-7-jre' (default)
#   The package that will be managed if $manage_java is set to true.
#
# manage_war = false (default)
#   Wether the module should also manage a Powerpack/HA war or not.
#   The war given in $powerpack_war will be installed if this is true
#
# war_location = '\somelocation\artifactory.war'
#   The war that will be managed if $managed_war is set to true.
#

class artifactory::config(
  $version      = '3.2.0',
  $destination  = '/opt',
  $user         = 'artifactory',
  $group        = 'artifactory',
  $port         = 8081,
  $manage_java  = true,
  $java_package = 'openjdk-7-jre',
  $manage_war   = false,
  $war_location = '',
) {

}
