class mysql::ndbd {

  file { 'cp_tar' :
    path => '/tmp/mysql-cluster-gpl-7.3.0-linux2.6-x86_64.tar.gz',
    source => 'puppet:///modules/mysql/mysql-cluster-gpl-7.3.0-linux2.6-x86_64.tar.gz',
    ensure => present,
    replace => true,
  }
  file { 'cp_installer' :
    path => '/tmp/installer.sh',
    content => template('mysql/ndb_installer_sh.erb'),
    mode => '0755',
    ensure => present,
    replace => true,
    require => File['cp_tar'],
  }
  file { 'my_cnf' :
    path => '/etc/my.cnf',
    content => template('mysql/ndbd_my_cnf.erb'),
    ensure => present,
    replace => true,
    require => File['cp_installer'],
  }
  exec { 'run_installer' :
    command => '/tmp/installer.sh',
    require => File['cp_installer'],
  }
}
