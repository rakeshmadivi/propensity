#!/bin/bash
# Reference: https://www.codebyamir.com/blog/parse-command-line-arguments-using-getopt
#set -x 

chelp(){
	echo -e "
	-c | --speccpu \t Run SPECCPU Test (Micro BenchMark)
	-j | --specjbb \t Run SPECJBB Test (Micro Benchmark)
	-m | --stream \t Run STREAM Test (Memory Bandwidth Benchmark)
	-d | --sss-pts \t Run SSS-PTS (Disk I/O Benchmark)
	-n | --iperf \t Run IPERF3 (Network Performance Test)
	-M | --sysbench \t Run Sysbench (CPU,File I/O,MySQL Benchmark)
	-R | --redis \t Run Redis Benchmark (In-Memory Database Benchmark)
	-N | --nginx \t Run NGINX Benchmark Test (Web Server Benchmark)"

	: '
	long=(${LONG//,/ });
	for i in $(seq 0 $(expr ${#1} - 1))
	do
		echo "-${1:$i:1} ${long[$i]}"
	done
	'
	exit
}

starting(){
	echo Preparing to run... ${@^^}
}

#: '
parse(){
	if [ $# -eq 0 ]
	then
		echo -e "No Test Provided to proceed.\nEx. $0 <Test-Name>";chelp;exit
	fi
	# Options followed with ':' means option value is required.
	# Options followed with '::' means option value is optional.
	# Options without ':' or '::' means it doesn't accept option value.
	SHORT=cjmdnMRNh
	LONG=speccpu,specjbb,stream,sss-pts,iperf,sysbench,redis,nginx,help

	OPTS=$(getopt --options $SHORT --long $LONG --name $0 -- "$@")

	eval set -- $OPTS
	#set +x

	while true
	do
		echo Checking $1
		case $1 in
			-h | --help) 
				chelp $SHORT $LONG
				shift;;
			-c | --speccpu ) starting spec-cpu
				shift;;

			-j | --specjbb ) starting spec-jbb
				shift;;

			-m | --stream )	starting stream
				shift;;

			-d | --sss-pts ) starting sss-pts
				shift;;

			-n | --iperf ) starting iperf
				shift;;

			-M | --sysbench ) starting sysbench
				shift;;

			-R | --redis ) starting redis
				shift;;

			-N | --nginx ) starting nginx
				shift;;

			--) shift;break
				;;
			#*) echo "STAR";break;;
		esac
	done
}
#'
#----- STARTING THE PROCESS
parse $@
