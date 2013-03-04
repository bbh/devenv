class php::codesniffer {

  exec { 'pear_install_codesniffer' :
    command => 'pear install PHP_CodeSniffer',
    path => ['/bin', '/usr/bin'],
    require => Exec['pear_install_phpunit'],
  }
}
