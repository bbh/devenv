class memcached {

  package { 'memcached' :
    ensure => installed,
  }
  file { 'config' :
    path => '/etc/sysconfig/memcached',
    mode => 0444,
    owner => root,
    group => root,
    ensure => present,
    content => template('memcached/memcached_sysconfig.erb'),
    require => Package["memcached"],
  }
  service { "memcached":
    ensure => true,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => [File['config'],Package['memcached']],
  }
  file{ 'addport' :
    path => '/tmp/addport.rb',
    mode => 0550,
    owner => root,
    group => root,
    ensure => present,
    content => template('memcached/iptables_rb.erb'),
    require => Service['memcached'],
  }
  exec { 'run_addport' :
    command => '/tmp/addport.rb',
    require => File['addport'],
  }
}
