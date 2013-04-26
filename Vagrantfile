Vagrant::Config.run do |config|

  config.vm.define :dev1 do |dev1|
    dev1.vm.box = "quantal64"
    dev1.vm.network :hostonly, "192.168.1.5"
    dev1.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "dev.pp"
    end
  end

  config.vm.define :dev2 do |dev2|
    dev2.vm.box = "quantal64"
    dev2.vm.network :hostonly, "192.168.1.6"
    dev2.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "dev.pp"
    end
  end

  config.vm.define :svn do |svn|
    svn.vm.box = "quantal64"
    svn.vm.network :hostonly, "192.168.1.10"
    svn.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "subversion.pp"
    end
  end

  config.vm.define :git do |git|
    git.vm.box = "quantal64"
    git.vm.network :hostonly, "192.168.1.15"
    git.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "git.pp"
    end
  end

  config.vm.define :jenkins do |jenkins|
    jenkins.vm.box = "quantal64"
    jenkins.vm.network :hostonly, "192.168.1.20"
    jenkins.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "jenkins.pp"
    end
  end

  config.vm.define :memcached do |memcached|
    memcached.vm.box = "centos6364m"
    memcached.vm.network :hostonly, "192.168.1.40"
    memcached.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "memcached.pp"
    end
  end

  config.vm.define :memcached2 do |memcached2|
    memcached2.vm.box = "centos6364m"
    memcached2.vm.network :hostonly, "192.168.1.41"
    memcached2.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "memcached.pp"
    end
  end

  config.vm.define :varnish do |varnish|
    varnish.vm.box = "centos6364m"
    varnish.vm.network :hostonly, "192.168.1.45"
    varnish.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "varnish.pp"
    end
  end

  config.vm.define :dbm do |dbm|
    dbm.vm.box = "quantal64"
    dbm.vm.network :hostonly, "192.168.1.50"
    dbm.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "mysql-master.pp"
    end
  end

  config.vm.define :dbs do |dbs|
    dbs.vm.box = "quantal64"
    dbs.vm.network :hostonly, "192.168.1.51"
    dbs.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "mysql-slave.pp"
    end
  end

  config.vm.define :ndbm do |ndbm|
    ndbm.vm.box = "centos6364m"
    ndbm.vm.network :hostonly, "192.168.1.50"
    ndbm.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "ndbm.pp"
    end
  end

  config.vm.define :ndbd1 do |ndbd1|
    ndbd1.vm.box = "centos6364m"
    ndbd1.vm.network :hostonly, "192.168.1.51"
    ndbd1.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "ndbd.pp"
    end
  end

  config.vm.define :ndbd2 do |ndbd2|
    ndbd2.vm.box = "centos6364m"
    ndbd2.vm.network :hostonly, "192.168.1.52"
    ndbd2.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "ndbd.pp"
    end
  end

  config.vm.define :mongo1 do |mongo1|
    mongo1.vm.box = "quantal64"
    mongo1.vm.network :hostonly, "192.168.1.50"
    #mongo1.vm.provision :puppet do |puppet|
    #  puppet.manifests_path = "puppet/manifests"
    #  puppet.module_path = "puppet/modules"
    #  puppet.manifest_file = "mongodb.pp"
    #end
  end

  config.vm.define :mongo2 do |mongo2|
    mongo2.vm.box = "quantal64"
    mongo2.vm.network :hostonly, "192.168.1.51"
    #mongo2.vm.provision :puppet do |puppet|
    #  puppet.manifests_path = "puppet/manifests"
    #  puppet.module_path = "puppet/modules"
    #  puppet.manifest_file = "mongodb.pp"
    #end
  end

  config.vm.define :mongo3 do |mongo3|
    mongo3.vm.box = "quantal64"
    mongo3.vm.network :hostonly, "192.168.1.52"
    #mongo3.vm.provision :puppet do |puppet|
    #  puppet.manifests_path = "puppet/manifests"
    #  puppet.module_path = "puppet/modules"
    #  puppet.manifest_file = "mongodb.pp"
    #end
  end

  config.vm.define :web do |web|
    web.vm.box = "quantal64"
    web.vm.network :hostonly, "192.168.1.30"
    web.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "web.pp"
    end
  end

  config.vm.define :wordpress do |wp|
    wp.vm.box = "centos6364m"
    wp.vm.network :hostonly, "192.168.10.70"
    #wp.vm.customize ["modifyvm", :id, "--memory", 2048, "--cpus", 4]
    wp.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef/cookbooks"
      chef.run_list = [ "recipe[wordpress::default]" ]
    end
  end

  config.vm.define :drupal do |drupal|
    drupal.vm.box = "centos6364m"
    drupal.vm.network :hostonly, "192.168.10.70"
    drupal.vm.customize ["modifyvm", :id, "--memory", 2048, "--cpus", 4]
    drupal.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef/cookbooks"
      chef.run_list = [ "recipe[drupal::default]" ]
    end
  end

end
