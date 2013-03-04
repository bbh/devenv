puppet-jenkins
==============

jenkins puppet module

  config.vm.define :jenkins do |jenkins|

    jenkins.vm.box = "quantal64"

    #jenkins.vm.customize ["modifyvm", :id, "--memory", 2048, "--cpus", 4]

    jenkins.vm.network :hostonly, "192.168.1.200"

    jenkins.vm.provision :puppet do |puppet|

      puppet.manifests_path = "Puppet/manifests"

      puppet.module_path = "Puppet/modules"

      puppet.manifest_file = "jenkins.pp"

    end

  end
