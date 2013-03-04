Puppet - Jenkins
==============

This module allows you to up a VM with a working version of Jenkins.

Requirements
------------
This VM has been proveed with Ubuntu Quantal (12.10), you can find the base  
image at the [Vagrant boxes][1] site

Vagrant example
---------------
If you want to use this VM out of the entire "devenv" project, you need to add  
the following configuration to your Vagrant file, and add the "jenkins" puppet  
module and the "jenkins.pp" manifest.
<pre>
config.vm.define :jenkins do |jenkins|
  jenkins.vm.box = "quantal64"
  jenkins.vm.network :hostonly, "192.168.1.200"
  jenkins.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file = "jenkins.pp"
  end
end</pre>

Manifest example
----------------
If you are using this VM out of the "devenv" project, you need to create your  
own manifest to call this modules, the following is an example of a Jekings  
that includes the required artifacts to test PHP code and obtain the code from  
a Git repository.
<pre>
include jenkins
include php::phpunit
include php::codesniffer
include php::depend
include php::messdetector
include php::cpd
include php::dcd
include jenkins::php::plugins
include jenkins::php::template
include jenkins::ant
include git</pre>

[1]: http://www.vagrantbox.es/ "Vagrant base boxes"