class php::dcd {

  exec { 'pear_install_phpdcd' :
    command => 'pear install phpunit/phpdcd-beta',
    path => ['/bin', '/usr/bin'],
    require => Exec['pear_install_phpcpd'],
  }
}
