#
# this configures our puppet test vm
#

# install required packages
#

class ci {

  include ci::jenkins

}
