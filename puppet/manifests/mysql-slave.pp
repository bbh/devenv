# master DSN
$master_host = '192.168.10.20'
$master_user = 'slave1'
$master_pass = 'slavepass'
$master_dbnm = 'test'
$client_ip   = '192.168.10.10'
$client_user = 'root'

include mysql::slave
