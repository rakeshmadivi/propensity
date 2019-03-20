function create_nodes()
{
	echo -e "CURRENT PBS SERVER NAME is:	`cat /var/spool/torque/server_name`\n"
	echo -e "CREATING Nodes List....\n"
	echo -e "compute-0-11 np=32
compute-0-12 np=32
compute-0-18 np=32
compute-0-19 np=32
compute-0-22 np=32
compute-0-9 np=32" > /var/spool/torque/server_priv/nodes

	echo -e "UPDATED Node List:\n`cat /var/spool/torque/server_priv/nodes`\n"
}

function mom_conf()
{
	for i in {n0,n1,n2,n3,n4,n5}
	do
		echo -e "\n$i: Changing MOM Configuration....\n"
		scp ./mom_config.txt $i:/var/spool/torque/mom_priv/config
		echo -e "$i: Now MOM Configuration is....\n"
		ssh $i 'cat /var/spool/torque/mom_priv/config'
	done

	echo -e "\nWant to update \"/etc/hosts\" File on Compute Nodes (y/n)? :\n"
	read change
	if [ "$change" == "y" ]
	then
		for i in {n0,n1,n2,n3,n4,n5}
		do
			echo -e "\n$i: Adding PBS Server IP to /etc/hosts....\n"
			ssh $i 'echo "27.1.1.1	shakuntala.local" >> /etc/hosts'
			echo -e "\nNEW \"/etc/hosts\" is:\n"
			ssh $i 'cat /etc/hosts'
			echo -e "\nRestarting MOM....\n"
			ssh $i 'service pbs_mom restart'
		done
	else
		for i in {n0,n1,n2,n3,n4,n5}
		do
			echo -e "\n$i: \"/etc/hosts\" is:\n"
			ssh $i 'cat /etc/hosts'
		done
	fi
}

function restart()
{
	echo -e "Restart PBS and MAUI Services on SERVER HOST...?(y/n):\n"	
	read change
	if [ "$change" == "y" ]
	then
		service pbs_server restart
		service maui restart
	fi

	echo -e "\nRestart MOMs on Compute Nodes (y/n)? :\n"
	read change
	if [ "$change" == "y" ]
	then
		for i in {n0,n1,n2,n3,n4,n5}
		do
			echo -e "\nCompute Node: $i"
			ssh $i 'service pbs_mom restart'
		done
	fi

}

function display_log()
{
	echo -e "LOG Displaying....\n"	
	tail /var/spool/torque/server_logs/`date +%Y%m%d`
	echo -e "\nmaui log....\n"
	tail /opt/maui/log/maui.log

	echo -e "\nMOM Logs....\n********"
	for i in {n0,n1,n2,n3,n4,n5}
	do
		echo -e "\n$i:"
		ssh $i 'tail -n 5 /var/spool/torque/mom_logs/`date +%Y%m%d`'
		echo -e "\n/var/log/messages on"
		ssh $i "date +\"%D- %T\""
		echo -e "******************"
		ssh $i 'tail -n 5 /var/log//messages'
	done
}

function job_stat()
{
	echo -e "JOB Status....\n"
	qstat
	qstat -f
}

function node_stat()
{
	echo -e "NODES Status...\n"
	pbsnodes -l
}

function current_conf()
{
	echo -e "CURRENT CONFIGURATION:\n"
	echo -e "CURRENT PBS SERVER NAME is:	`cat /var/spool/torque/server_name`\n"
	echo -e "CURRENT Node List:\n`cat /var/spool/torque/server_priv/nodes`\n"
	
	echo -e "CURRENT MOM Configuration is....\n"
	for i in {n0,n1,n2,n3,n4,n5}
	do
		echo -e "$i: MOM Configuration is...."
		ssh $i 'cat /var/spool/torque/mom_priv/config'
		echo -e "********* MOUNTED File System on: $i *************"
		ssh $i 'df -h'
		echo -e "******************************************"
	done
}

function change()
{
	rm -f exports.txt
	for i in {9,11,12,18,19}
	do 
		echo -e "/export compute-0-${i}(rw,async,no_root_squash)" >> exports.txt
	done

	echo -e "\nChange /etc/exports file\n from \n`cat /etc/exports` \n\n to \n\n`cat exports.txt` \n(y/n)? :\n"
	read change
	if [ "$change" == "y" ]
	then
		cp exports.txt /etc/exports
		echo -e "Restaring 'autofs' service to export"
		service autofs restart
	fi

	echo -e "\nWant to * REBOOT * Compute Nodes (y/n)? :\n"
	read change
	if [ "$change" == "y" ]
	then
		for i in {9,11,12,18,19}
		do
			echo -e "\nRebooting $i\n"
			ssh $i 'df -h'
		done
	fi
}

function create_DBq()
{
	echo -e "\nWant to Create DB (y/n)? :\n"
	read change
	if [ "$change" == "y" ]
	then
		qterm -t quick
		echo -e "CREATING DB"
		pbs_server -t create
	fi

	echo -e "\nWant to Default Queue 'batch' (y/n)? :\n"
	read change
	if [ "$change" == "y" ]
	then	
		echo -e "CREATING DEFAULT 'batch' queue"
		qmgr -c 'create queue batch'
		qmgr -c 'set queue batch queue_type = Execution'
		qmgr -c 'set queue batch resources_default.nodes = 1'
		qmgr -c 'set queue batch resources_default.walltime = 01:00:00'
		qmgr -c 'set queue batch enabled = True'
		qmgr -c 'set queue batch started = True'
	fi
	echo -e "current server DB configuration"
	qmgr -c 'p s'
	
	echo -e "\nExisting Queues"
	qstat -q
}


if [ "$#" -ne "1" ]
then
	echo -e "Please enter atleast one parameter\n"
	echo -e "Use Following Options
		 1	- To Create Nodes file
		 2	- To Restart Services
		 3	- To Disply Node Status
		 4	- To Display Log
		 5	- To Display JOB Status
		 6	- To Update & Display MOM Configuration
		 7	- To Display CURRENT Configuration
		 8	- To Chnage /etc/exports file
		 9	- To Create DB and Default 'batch' queue 
"
else
	if [ "$1" == "1" ]
	then
		create_nodes
		restart
	fi

	if [ "$1" == "2" ]
	then
		restart
	fi

	if [ "$1" == "3" ]
	then
		node_stat
	fi

	if [ "$1" == "4" ]
	then
		display_log
	fi

	if [ "$1" == "5" ]
	then
		job_stat
	fi

	if [ "$1" == "6" ]
	then
		mom_conf
	fi

	if [ "$1" == "7" ]
	then
		current_conf
	fi

	if [ "$1" == "8" ]
	then
		change
	fi
	if [ "$1" == "9" ]
	then
		create_DBq
	fi
fi
















	
