echo -e "\nCreating \"batch\" Queue...\n"
qmgr -c "create queue batch"

qmgr -c "set queue batch queue_type = Execution"
qmgr -c "set queue batch resources_max.mem = 100gb"
qmgr -c "set queue batch resources_max.procs = 100"
qmgr -c "set queue batch resources_max.walltime = 01:00:00"
qmgr -c "set queue batch enabled = True"
qmgr -c "set queue batch started = True"


#qmgr -c "set server scheduling = True"
#qmgr -c "set server managers = root@`hostname`"
#qmgr -c "set server default_queue = batch"
#qmgr -c "set server log_events = 511"
#qmgr -c "set server mail_from = root"
#qmgr -c "set server scheduler_iteration = 600"
#qmgr -c "set server node_check_rate = 150"
#qmgr -c "set server tcp_timeout = 6"

echo -e "All Queues in PBS Server"
qstat -q

echo -e "\nWant to Create Somemore COMPLEX Queues...(y/n)\n"

read choice
if [ "$choice" == "y" ]
then

	create queue routing
	set queue routing queue_type = Route
	set queue routing route_destinations = P16
	set queue routing route_destinations += P8
	set queue routing route_destinations += P4
	set queue routing route_destinations += P1-2
	set queue routing route_destinations += serial
	set queue routing enabled = True
	set queue routing started = True

	create queue serial
	set queue serial queue_type = Execution
	set queue serial resources_max.mem = 20gb
	set queue serial resources_max.ncpus = 1
	set queue serial resources_max.nodes = 1
	set queue serial resources_max.procs = 1
	set queue serial resources_max.walltime = 720:00:00
	set queue serial resources_min.procs = 1
	set queue serial max_user_run = 4
	set queue serial enabled = True
	set queue serial started = True

	create queue P1-2
	set queue P1-2 queue_type = Execution
	set queue P1-2 resources_max.mem = 20gb
	set queue P1-2 resources_max.procs = 2
	set queue P1-2 resources_max.walltime = 24:00:00
	set queue P1-2 resources_min.procs = 1
	set queue P1-2 enabled = True
	set queue P1-2 started = True

	create queue P4
	set queue P4 queue_type = Execution
	set queue P4 resources_max.mem = 12gb
	set queue P4 resources_max.procs = 4
	set queue P4 resources_max.walltime = 24:00:00
	set queue P4 enabled = True
	set queue P4 started = True

	create queue P8
	set queue P8 queue_type = Execution
	set queue P8 resources_max.mem = 24gb
	set queue P8 resources_max.procs = 8
	set queue P8 resources_max.walltime = 24:00:00
	set queue P8 max_user_run = 8
	set queue P8 enabled = True
	set queue P8 started = True

	create queue P16
	set queue P16 queue_type = Execution
	set queue P16 resources_max.mem = 24gb
	set queue P16 resources_max.procs = 16
	set queue P16 resources_max.walltime = 24:00:00
	set queue P16 max_user_run = 1
	set queue P16 enabled = True
	set queue P16 started = True

	#set server scheduling = True
else
	echo -e "\nNot creating any COMPLEX Queues.. Exiting..\n"
fi

