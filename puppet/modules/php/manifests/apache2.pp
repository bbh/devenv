class php::apache2 {

  case $operatingsystem {

    debian, ubuntu: {

      $main_package = 'libapache2-mod-php5'
    }
  }

  package { $main_package :

   ensure => installed,
  }
}
