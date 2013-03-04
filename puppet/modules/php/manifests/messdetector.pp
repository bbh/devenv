class php::messdetector {

  exec { 'pear_channel_phpmd' :
    command => 'pear channel-discover pear.phpmd.org',
    path => ['/bin', '/usr/bin'],
  }

  exec { 'pear_install_phpmd' :
    command => 'pear install phpmd/PHP_PMD',
    path => ['/bin', '/usr/bin'],
    require => Exec['pear_install_depend'],
  }
}
