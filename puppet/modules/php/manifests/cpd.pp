class php::cpd {

  exec { 'pear_install_phpcpd' :
    command => 'pear install phpunit/phpcpd',
    path => ['/bin', '/usr/bin'],
    require => Exec['pear_install_phpmd'],
  }
}
