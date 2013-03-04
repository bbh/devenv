Puppet - MySQL
==============

This module helps to create MySQL environments for Master-Slave & Cluster models

MySQL cluster
-------------
Once installed, you can use the following commands to start your cluster

To start the Management node
<pre>
ndb_mgmd -f /var/lib/mysql-cluster/config.ini --ndb-nodeid=1</pre>

To start the API node
<pre>
/etc/init.d/mysql.server start</pre>

To start the Data node
<pre>
ndbmtd -c 192.168.1.20 --ndb-nodeid=2 --initial-start</pre>
