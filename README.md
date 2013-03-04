Development Environment with Vagrant
====================================

The intention of this project is to provide a complete development pipeline for  
programmers and help them to develop and test their applications in environments  
closer to the real production than their standalone local environments.

To do it, we are currently using Vagrant/Puppet and Virtualbox. This project  
includes VMs to provide the followin list of services:

* Git
* Subversion
* Jenkins
* Apache/PHP
* Memcached
* Varnish
* MySQL (master-slave)
* MySQL (cluster)

I'm currently working on the following services to release them soon:

* Nginx/PHP
* Nginx (balancer)
* MongoDB
* PostgreSQL

Notes about Vagrant
-------------------
This project provides a Vagrantfile you can use to create your VMs, please make  
sure that you already have Vagrant installed and vagrant boxes with same name.

Actually this project works with Puppet modules, in future versions some Chef  
cookbooks will also be included.

Puppet Requirements
-------------------
The puppet module "jenkins" requires the submodule "apt" from  
https://github.com/camptocamp/puppet-apt

Download the MySQL Cluster tarball from http://www.mysql.com/downloads/cluster/  
add it to the "files" dir (create it if not exists) in puppet module "mysql".  
Example:
<pre>
$ cp ~/mysql-cluster-gpl-7.3.0-linux2.6-x86_64.tar.gz \
     ~/devenv/puppet/modules/mysql/files/</pre>
