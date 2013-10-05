$master_ip  = '192.168.10.20'
$slave_ip   = '192.168.10.21'
$slave_user = 'slave1'
$slave_pass = 'slavepass'
$database   = 'test'
$client_ip  = '192.168.10.10'
$client_user= 'root'

include mysql::master
