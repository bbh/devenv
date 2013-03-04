class php::cli {

  case $operatingsystem {

    debian, ubuntu: {

      $package = 'php5-cli'
    }
  }

  package { $package:

    ensure => installed,
  }
}
