class memcached {

  package { 'memcached' :
    ensure => installed,
  }
  file { 'config' :
    path => '/etc/memcached.conf',
    mode => 0444,
    owner => root,
    group => root,
    ensure => present,
    content => template('memcached/memcached.conf.erb'),
    require => Package["memcached"],
  }
  service { "memcached" :
    ensure => true,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => File["config"],
  }
}
