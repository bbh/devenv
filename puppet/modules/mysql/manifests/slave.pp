class mysql::slave {

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
    content => template('mysql/slave_my_cnf.erb'),
    notify  => Service["mysqld"],
    ensure => present,
    replace => true,
    require => Package['mysql-server'],
  }
  file { 'copy_script' :
    path => '/tmp/connect_to_master.rb',
    content => template('mysql/connect_to_master_rb.erb'),
    mode => '0755',
    require => File['my_cnf'],
  }
  package { 'ruby-mysql' :
    ensure => installed,
    require => File['copy_script'],
  }
  exec { 'connect_to_master' :
    command => "/tmp/connect_to_master.rb",
    logoutput => "on_failure",
    require => Package['ruby-mysql'],
  }
}
