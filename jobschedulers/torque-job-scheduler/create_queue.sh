qmgr -c 'create queue batch'
qmgr -c 'set queue batch queue_type = Execution'
qmgr -c 'set queue batch resources_default.nodes = 1'
qmgr -c 'set queue batch resources_default.walltime = 01:00:00'

qmgr -c 'set queue batch enabled = True'

qmgr -c 'set queue batch started = True'
