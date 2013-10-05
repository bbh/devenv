class php::cli {

  case $operatingsystem {

    debian, ubuntu: {

      $package = 'php5-cli'
    }
  }

  package { $package:

    ensure => installed,
  }

  package { "php5-memcache":
    ensure => installed,
  }

  package { "php5-mysqlnd":
    ensure => installed,
  }
}
