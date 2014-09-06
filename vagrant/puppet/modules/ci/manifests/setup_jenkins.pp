class ci::setup_jenkins {

  include jenkins

  jenkins::plugin {
    'git-client': ;
    'scm-api': ;
    'git': ;
    'jquery': ;
    'parameterized-trigger': ;
    'build-pipeline-plugin': ;
  }

}
