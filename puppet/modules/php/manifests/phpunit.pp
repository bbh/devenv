class php::phpunit {

  Package { ensure => "installed", }
  package { 'php-pear' : }
  package { 'php5-curl' :
    require => Package['php-pear'],
  }
  package { 'php5-dev' :
    require => Package['php5-curl'],
  }

  exec { 'pear_upgrade' :
    command => 'pear upgrade pear',
    path => ['/bin', '/usr/bin'],
    require => Package['php5-dev'],
  }

  exec { 'pear_set_auto_discover' :
    command => 'pear config-set auto_discover 1',
    path => ['/bin', '/usr/bin'],
    require => Exec['pear_upgrade'],
  }

  exec { 'pear_install_phpunit' :
    command => 'pear install pear.phpunit.de/PHPUnit',
    path => ['/bin', '/usr/bin'],
    require => Exec['pear_set_auto_discover'],
  }
}
