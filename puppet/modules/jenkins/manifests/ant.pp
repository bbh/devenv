class jenkins::ant {

  package { 'ant' :

    ensure => installed,
  }

  package { 'default-jdk' :

    ensure => installed,
  }
}
