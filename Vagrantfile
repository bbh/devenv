Vagrant::Config.run do |config|

  config.vm.define :tomcat do |tom|
    tom.vm.box = "centos64"
    tom.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
    tom.vm.network :hostonly, "192.168.30.10"
    tom.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef/cookbooks"
      chef.run_list = ["recipe[tomcat::default]", "recipe[tomcat::jenkins]"]
    end
  end

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
    memcached.vm.box_url = "https://s3.amazonaws.com/itmat-public/centos-6.3-chef-10.14.2.box"
    memcached.vm.network :hostonly, "192.168.1.40"
    memcached.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "memcached.pp"
    end
  end

  config.vm.define :memcached2 do |memcached2|
    memcached2.vm.box = "centos6364m"
    memcached2.vm.box_url = "https://s3.amazonaws.com/itmat-public/centos-6.3-chef-10.14.2.box"
    memcached2.vm.network :hostonly, "192.168.1.41"
    memcached2.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "memcached.pp"
    end
  end

  config.vm.define :varnish do |varnish|
    varnish.vm.box = "centos6364m"
    varnish.vm.box_url = "https://s3.amazonaws.com/itmat-public/centos-6.3-chef-10.14.2.box"
    varnish.vm.network :hostonly, "192.168.2.45"
    
    #varnish.vm.customize ["modifyvm", :id, "--memory", 2048]
    # varnish.vm.provision :chef_solo do |chef|
    #   chef.cookbooks_path = "chef/cookbooks"
    #   chef.run_list = [ "recipe[varnish::default]" ]
    # end
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
    ndbm.vm.box_url = "https://s3.amazonaws.com/itmat-public/centos-6.3-chef-10.14.2.box"
    ndbm.vm.network :hostonly, "192.168.1.50"
    ndbm.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "ndbm.pp"
    end
  end

  config.vm.define :ndbd1 do |ndbd1|
    ndbd1.vm.box = "centos6364m"
    ndbd1.vm.box_url = "https://s3.amazonaws.com/itmat-public/centos-6.3-chef-10.14.2.box"
    ndbd1.vm.network :hostonly, "192.168.1.51"
    ndbd1.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "ndbd.pp"
    end
  end

  config.vm.define :ndbd2 do |ndbd2|
    ndbd2.vm.box = "centos6364m"
    ndbd2.vm.box_url = "https://s3.amazonaws.com/itmat-public/centos-6.3-chef-10.14.2.box"
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
    wp.vm.box = "centos64"
    wp.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
    wp.vm.network :hostonly, "192.168.10.70"
    wp.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef/cookbooks"
      chef.run_list = [ "recipe[wordpress::default]" ]
    end
  end

  config.vm.define :drupal do |drupal|
    drupal.vm.box = "centos64"
    drupal.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
    drupal.vm.network :hostonly, "192.168.10.70"
    drupal.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef/cookbooks"
      chef.run_list = [ "recipe[drupal::default]" ]
    end
  end

end
