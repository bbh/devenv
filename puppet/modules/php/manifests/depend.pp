class php::depend {

  exec { 'pear_channel_depend' :
    command => 'pear channel-discover pear.pdepend.org',
    path => ['/bin', '/usr/bin'],
  }

  exec { 'pear_install_depend' :
    command => 'pear install pdepend/PHP_Depend-beta',
    path => ['/bin', '/usr/bin'],
    require => Exec['pear_install_codesniffer'],
  }
}
