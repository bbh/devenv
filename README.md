Development Environments with Vagrant
=====================================

About
-----
The intention of this project is to provide a complete development pipeline for  
programmers and help them to develop and test their applications in environments  
closer to the real production than their standalone local environments.

To do it, we are currently using Vagrant/Puppet and Virtualbox. This project  
includes VMs to provide the following services:

* Git
* Subversion
* Jenkins
* Apache/PHP
* Memcached
* MySQL (master-slave)
* MySQL (cluster)

I'm currently working on the following services to release them soon:

* Varnish
* Nginx/PHP
* Nginx (balancer)
* MongoDB
* PostgreSQL

Actually this project works with Puppet modules, in future versions some Chef  
cookbooks will also be included.

Vagrant Notes
-------------
It's assumed that you already know how to use [Vagrant][1].

This project provides a Vagrantfile you can use to create your VMs, please make  
sure that you already have Vagrant installed and vagrant boxes with same name.

Puppet's requirements
---------------------
It's assumed that you already know how to use [Puppet][2].

The puppet module "jenkins" requires the submodule "apt" from [Github][3]

Get the tarball from [MySQL Downloads][4] and add it to the "files" directory  
(create it if do not exists) in the "mysql" puppet module.  
Example:
<pre>
$ cp ~/mysql-cluster-gpl-7.3.0-linux2.6-x86_64.tar.gz \
     ~/devenv/puppet/modules/mysql/files/</pre>

Legal
-----
This project is under the terms of the [LGPL][5] license version 3.0, submodules  
and third party components are licensed according to their owners.

Copyright &copy; 2013 Basilio Briceño `<bbh at briceno.mx>`

[1]: http://docs.vagrantup.com/v1/docs/ "Vagrant documentation"
[2]: http://docs.puppetlabs.com/puppet/ "Puppet documentation"
[3]: https://github.com/camptocamp/puppet-apt "Camptocamp's github repository"
[4]: http://www.mysql.com/downloads/cluster/ "MySQL Cluster download"
[5]: http://www.gnu.org/copyleft/lesser.html "GNU Lesser General Public License"
