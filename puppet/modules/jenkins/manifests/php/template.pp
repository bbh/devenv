class jenkins::php::template {

  file { 'template_dir':
    path => '/var/lib/jenkins/jobs/php-template',
    mode => '0755',
    owner => 'jenkins',
    group => 'nogroup',
    ensure => 'directory',
    recurse => true,
    require => Exec['load_installer'],
  }

  file { 'copy_template' :
    path => '/var/lib/jenkins/jobs/php-template/config.xml',
    source => 'puppet:///modules/jenkins/config.xml',
    mode => '0644',
    owner => 'jenkins',
    group => 'nogroup',
    require => File['template_dir'],
  }

  file { 'build_dir':
    path => '/home/vagrant/build',
    mode => '0755',
    owner => 'jenkins',
    group => 'nogroup',
    ensure => 'directory',
    recurse => true,
    require => File['copy_template'],
  }

  file { 'copy_build' :
    path => '/home/vagrant/build/build.xml',
    source => 'puppet:///modules/jenkins/build.xml',
    mode => '0644',
    owner => 'jenkins',
    group => 'nogroup',
    require => File['build_dir'],
  }

}
