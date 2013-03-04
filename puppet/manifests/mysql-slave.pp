# master DSN
$master_host = '192.168.1.10'
$master_user = 'slave1'
$master_pass = 'slavepass'
$master_dbnm = 'test'

include mysql::slave
