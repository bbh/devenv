class jenkins {

  include apt

  apt::key { 'D50582E6':
    source => 'http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key',
  }

  apt::sources_list { 'jenkins':
    ensure  => present,
    content => 'deb http://pkg.jenkins-ci.org/debian-stable binary/',
    # The above gives you the LTS release. Use the below repo to get the very latest
    # content => 'deb http://pkg.jenkins-ci.org/debian binary/',
    require => Apt::Key['D50582E6'],
  }

  package { 'jenkins':
    ensure  => installed,
    require => Apt::Sources_list['jenkins'],
  }

  service { 'jenkins':
    ensure  => running,
    enable  => true,
    require => Package['jenkins'],
  }
}
