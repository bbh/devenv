class jenkins::php::plugins {

#  file { 'copy_jenkins_cli' :
#    path => '/home/vagrant/jenkins-cli.jar',
#    source => 'puppet:///jenkins/jenkins-cli.jar',
#    mode => '0755',
#    owner => 'jenkins',
#    group => 'nogroup',
#    require => Service['jenkins'],
#  }
#  exec { 'copy_jenkins_cli' :
#    #command => 'wget -q -O /tmp/jenkins-cli.jar http://localhost:8080/jnlpJars/jenkins-cli.jar > /dev/null',
#    command => 'cp /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar /tmp/jenkins-cli.jar',
#    path => ['/bin', '/usr/bin'],
#    require => Service['jenkins'],
#  }

#  exec { 'update_plugins' :
#    command => "curl -s -L http://updates.jenkins-ci.org/update-center.json | sed '1d;$d' | curl -s -X POST -H 'Accept: application/json' -d @- http://localhost:8080/updateCenter/byId/default/postBack > /dev/null",
#    path => ['/bin', '/usr/bin'],
#    require => Exec['copy_jenkins_cli'],
#  }

#  exec { 'install_plugins' :
#    command => 'java -jar /tmp/jenkins-cli.jar -s http://localhost:8080 install-plugin git checkstyle cloverphp dry htmlpublisher jdepend plot pmd violations xunit',
#    path => ['/bin', '/usr/bin'],
#    #require => [ File['copy_jenkins_cli'], Package['ant'] ],
#    require => Exec['copy_jenkins_cli'],
#  }

#  exec { 'restart_jenkins' :
#    command => 'java -jar /tmp/jenkins-cli.jar -s http://localhost:8080 safe-restart',
#    path => ['/bin', '/usr/bin'],
#    require => Exec['install_plugins'],
#  }

  file { 'copy_installer' :
    path => '/tmp/jenkins_plugins_installer.sh',
    source => "puppet:///modules/jenkins/plugins_installer.sh",
    mode => '0755',
    owner => 'jenkins',
    group => 'nogroup',
    require => Service['jenkins'],
  }

  exec { 'load_installer' :
    command => '/tmp/jenkins_plugins_installer.sh',
    require => File['copy_installer'],
    logoutput => 'on_failure',
  }
}
