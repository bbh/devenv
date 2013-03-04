puppet-mysql
============

This puppet helps to create MySQL environments for Master-Slave and Cluster models

To start the Management node
`ndb_mgmd -f /var/lib/mysql-cluster/config.ini --ndb-nodeid=1`

To start the API node
`/etc/init.d/mysql.server start`

To start the Data node
`ndbmtd -c 192.168.1.20 --ndb-nodeid=2 --initial-start`

