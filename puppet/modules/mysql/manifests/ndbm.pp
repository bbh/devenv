class mysql::ndbm {

  file { 'cp_tar' :
    path => '/tmp/mysql-cluster-gpl-7.3.0-linux2.6-x86_64.tar.gz',
    source => 'puppet:///modules/mysql/mysql-cluster-gpl-7.3.0-linux2.6-x86_64.tar.gz',
    ensure => present,
    replace => true,
  }
  file { 'cp_installer' :
    path => '/tmp/installer.sh',
    content => template('mysql/ndbm_installer_sh.erb'),
    mode => '0755',
    ensure => present,
    replace => true,
    require => File['cp_tar'],
  }
  exec { 'run_installer' :
    command => '/tmp/installer.sh',
    require => File['cp_tar'],
  }
  file { 'mysql_cluster_dir' :
    path => '/var/lib/mysql-cluster',
    mode => '0755',
    ensure => 'directory',
    recurse => true,
    require => File['cp_tar'],
  }
  file { 'config_ini' :
    path => '/var/lib/mysql-cluster/config.ini',
    content => template('mysql/ndbm_config_ini.erb'),
    ensure => present,
    replace => true,
    require => File['cp_installer'],
  }
}
