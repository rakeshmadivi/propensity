#!/bin/bash

stats=/sys/class/net/enp134s0f0/statistics/
[ -z $2 ] && echo -e "Invalid no.of arguments... \nEx: $0 <N/W-Interface-name> <nC-nS|nC-yS|yC-yS>" && exit;

ppsfile=${2}_pps.txt
bwfile=${2}_bw.txt

ppslog=${2}_pps.log
bwlog=${2}_bw.log

packets_per_second()
{
	INTERVAL="1"  # update interval in seconds
 
	if [ -z "$1" ]; then
		echo
		echo usage: $0 [network-interface]
		echo
		echo e.g. $0 eth0
		echo
		echo shows packets-per-second
		exit
	fi
	 
	IF=$1
	
	while true
	do
		R1=`cat /sys/class/net/$1/statistics/rx_packets`
		T1=`cat /sys/class/net/$1/statistics/tx_packets`
		sleep $INTERVAL
		R2=`cat /sys/class/net/$1/statistics/rx_packets`
		T2=`cat /sys/class/net/$1/statistics/tx_packets`
		TXPPS=`expr $T2 - $T1`
		RXPPS=`expr $R2 - $R1`
		echo `date` collecting pps >> $ppsfile
		#echo "$1 Packets/Second: TX $TXPPS RX $RXPPS" >> $ppsfile
		echo "${TXPPS},${RXPPS}" >> $ppsfile
	done
}

bandwidth()
{
	INTERVAL="1"  # update interval in seconds
	#echo $0;$1;exit;
 
	if [ -z "$1" ]; then
		echo
		echo usage: $0 [network-interface]
		echo
		echo e.g. $0 eth0
		echo
		exit
	fi
	 
	IF=$1
	 
	while true
	do
		R1=`cat /sys/class/net/$1/statistics/rx_bytes`
		T1=`cat /sys/class/net/$1/statistics/tx_bytes`
		sleep $INTERVAL
		R2=`cat /sys/class/net/$1/statistics/rx_bytes`
		T2=`cat /sys/class/net/$1/statistics/tx_bytes`
		TBPS=`expr $T2 - $T1`
		RBPS=`expr $R2 - $R1`
		TKBPS=`expr $TBPS / 1024`
		RKBPS=`expr $RBPS / 1024`
		echo `date` collecting bw >> $bwfile
		#echo "${1} kB/s: TX $TKBPS RX $RKBPS" >> $bwfile
		# TX,RX
		echo "${TKBPS},${RKBPS}" >> $bwfile
	done
}

ts=$SECONDS
packets_per_second $1 &
pps_pid=$!
te=$SECONDS
pkts_collection_time=$(echo $te - $ts | bc )
echo `date` PPS_PID=$pps_pid Time Elapsed: $pkts_collection_time >> $ppslog

ts=$SECONDS
bandwidth $1 &
bw_pid=$!
te=$SECONDS
bw_collection_time=$(echo $te - $ts | bc )
echo `date` BW_PID=$bw_pid Time Elapsed: $bw_collection_time >> $bwlog

ts=$SECONDS
echo Collecting mpastats...
# mpstat -P 24,72 -u 1 > ${2}_mpstat.txt
while true
do
	mpstat -P 24,72 -u 1 1|egrep -v "Linux|%|Average" | awk '{print $1,$2,$4,$6,$13}' | tr " " "," >> ${2}_mpstat.txt
	#sleep 1
done

te=$SECONDS
mpstat_collection_time=$(echo $te - $ts | bc)

trap "echo -e \"Elapsed times:\nPacket Collection: ${pkts_collection_time}\nBandwidth: ${bw_collection_time}\nMPSTAT: ${mpstat_collection_time}\";exit" SIGINT


