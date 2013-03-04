class git::gitosis {

  exec { "git clone git://eagain.net/gitosis" :
    creates => "/tmp/gitosis",
    cwd => "/tmp",
    alias => "clone_gitosis",
    timeout => "0"
  }

  exec { "python setup.py install":
    require => Exec["clone_gitosis"],
    creates => "/usr/bin/gitosis-init",
    alias => "install_gitosis",
    timeout => "0",
    cwd => "/tmp/gitosis"
  }

  file { "/home/gitosis":
    ensure => "directory"
  }

  file { "/home/gitosis/.ssh/":
    ensure => "directory",
    recurse => true,
    owner => "gitosis",
    group => "gitosis",
    require => File["/home/gitosis"]
  }

  file { "/home/gitosis/.ssh/gitosis.pub":
    source => "puppet:///modules/git/gitosis.pub",
    owner => "gitosis",
    group => "gitosis"
  }

  file { "/var/lib/gitosis/gitosis":
    ensure => "directory",
    recurse => true,
    owner => "gitosis",
    group => "gitosis"
  }

  file { "/var/lib/gitosis/repositories":
    ensure => "directory",
    owner => "gitosis",
    group => "gitosis"
  }

  exec { "sudo -H -u gitosis gitosis-init < /home/gitosis/.ssh/gitosis.pub":
    require => [Exec["install_gitosis"], File["/home/gitosis/.ssh/gitosis.pub"], File["/home/gitosis"]],
    alias => "init_gitosis",
    creates => "/var/lib/gitosis/repositories/gitosis-admin.git"
  }

  file { "/var/lib/gitosis/repositories/gitosis-admin.git/hooks/post-update":
    mode => "755",
    require => Exec["init_gitosis"]
  }

  file { "/usr/share/src/gitosis-admin/gitosis.conf":
    content => template("git/gitosis_conf.erb"),
    require => Exec["init_gitosis"],
    notify => Exec["update_gitosis_admin"]
  }

  exec { "update_gitosis_admin":
    cwd => "/usr/share/src/gitosis-admin",
    command => "git add .; git commit -m 'Pushed from puppet master'; git push"
  }

  define generate_key_files {
    file { "/usr/share/src/gitosis-admin/keydir/$name.pub":
      content => template("git/pub_key.erb"),
      notify => Exec["update_gitosis_admin"]
    }
  }

  $pub_key_names_array = split($pub_key_names, ',')
  generate_key_files { $pub_key_names_array: }
}
