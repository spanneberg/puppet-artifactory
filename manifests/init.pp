# Class: artifactory
# 
# This class will install Artifactory with the default parameters given
# in artifactory::config and start the Artifactory service afterwards.
#
class artifactory {

  include artifactory::install
  include artifactory::service

}
