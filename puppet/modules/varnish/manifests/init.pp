class varnish::repo {

  Package {
    provider => rpm,
    ensure => installed
  }

  package { "varnish-release":
    source => "http://repo.varnish-cache.org/redhat/varnish-3.0/el5/noarch/varnish-release-3.0-1.noarch.rpm"
  }
}

class varnish::install {

  $packagelist = ["varnish"]

  package { $packagelist:
    require => Class ["varnish::repo"],
    ensure => installed
  }
}

class varnish::service {

  service { "varnish":
    ensure => true,
    enable => true,
    hasrestart => true,
    hasstatus => true,
    require => Class ["varnish::install"]
  }
}

class varnish::conf {

  File {
    require => Class ["varnish::install"],
    owner => "root",
    group => "root",
    mode => 644,
    notify => Class ["varnish::service"]
  }

  file { "/etc/varnish/default.vcl":
    source  => "puppet:///modules/varnish/default.vcl"
  }

  file { "/etc/sysconfig/varnish":
    source  => "puppet:///modules/varnish/varnish"
  }
}

class varnish {

  include varnish::repo,
          varnish::install,
          varnish::service,
          varnish::conf
}
