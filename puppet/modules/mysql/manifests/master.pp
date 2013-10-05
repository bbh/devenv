class mysql::master {

  package { 'mysql-client' :
    ensure => installed,
  }
  package { 'mysql-server' :
    ensure => installed,
  }
  service { 'mysqld' :
    name => 'mysql',
    enable => true,
    ensure => running,
    hasrestart => true,
    require => Package['mysql-server'],
  }
  file { 'my_cnf' :
    path => '/etc/mysql/my.cnf',
    content => template('mysql/master_my_cnf.erb'),
    notify  => Service["mysqld"],
    ensure => present,
    replace => true,
    require => Package['mysql-server'],
  }
  exec { 'create_user' :
    command => "mysql -u root -e \"CREATE USER '$slave_user'@'%' IDENTIFIED BY '$slave_pass';\"",
    path => ['/bin','/usr/bin'],
    require => Service['mysqld'],
  }
  exec { 'create_db' :
    command => "mysql -u root -e \"CREATE DATABASE IF NOT EXISTS $database;\"",
    path => ['/bin','/usr/bin'],
    require => Exec['create_user'],
  }
  exec { 'grant_replication' :
    command => "mysql -u root -e \"GRANT SUPER, REPLICATION CLIENT, REPLICATION SLAVE ON *.* TO '$slave_user'@'%';\"",
    path => ['/bin','/usr/bin'],
    require => Exec['create_db'],
  }
  exec { 'grant_client' :
    command => "mysql -u root -e \"CREATE USER '$client_user'@'$client_ip'; GRANT ALL ON *.* TO '$client_user'@'$client_ip';\"",
    path => ['/bin','/usr/bin']
  }
}
