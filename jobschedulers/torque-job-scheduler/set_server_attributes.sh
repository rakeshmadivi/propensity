#
# Set server attributes.
#

echo -e "SETTING Server Attributes...\n"
qmgr -c 'set server scheduling = True'
qmgr -c "set server acl_hosts = `hostname`"
qmgr -c "set server acl_hosts += shakuntala.local"
qmgr -c "set server managers = maui@`hostname`"
qmgr -c "set server managers += test@`hostname`"
qmgr -c "set server managers += root@`hostname`"

qmgr -c 'set server managers += maui@shakuntala.local'
qmgr -c 'set server managers += test@shakuntala.local'
qmgr -c 'set server managers += root@shakuntala.local'

qmgr -c "set server operators = maui@`hostname`"
qmgr -c "set server operators += test@`hostname`"
qmgr -c "set server operators += root@`hostname`"

qmgr -c 'set server operators += maui@shakuntala.local'
qmgr -c 'set server operators += test@shakuntala.local'
qmgr -c 'set server operators += root@shakuntala.local'

qmgr -c 'set server log_events = 511'
qmgr -c 'set server mail_from = adm'
qmgr -c 'set server scheduler_iteration = 600'
qmgr -c 'set server node_check_rate = 150'
qmgr -c 'set server tcp_timeout = 300'
qmgr -c 'set server job_stat_rate = 45'
qmgr -c 'set server poll_jobs = True'
qmgr -c 'set server mom_job_sync = True'
qmgr -c 'set server next_job_number = 5'
qmgr -c 'set server moab_array_compatible = True'
qmgr -c 'set server nppcu = 1'
qmgr -c 'set server default_queue = batch'

echo -e "Current Server Attributes...\n"
qmgr -c 'p s'
