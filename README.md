Development Environment with Vagrant
====================================

Requirements
------------
The puppet module "jenkins" requires the submodule "apt" from 
https://github.com/camptocamp/puppet-apt

Download the MySQL Cluster tarball from http://www.mysql.com/downloads/cluster/  
add it to the "files" dir (create it if not exists) in puppet module "mysql".  
Example:
<pre>
$ cp ~/mysql-cluster-gpl-7.3.0-linux2.6-x86_64.tar.gz \
     ~/devenv/puppet/modules/mysql/files/</pre>
