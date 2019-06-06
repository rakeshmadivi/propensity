#!/bin/bash

[ -z $1 ] && echo -e "Invalid no.of arguments... \nHelp: \n$0 <Result-Dir>	Script internally looks for Result-Dir-<C|S> Directories\n" && exit;

# PING_BULK SET GET INCR LPUSH RPUSH LPOP RPOP SADD SPOP LPUSH LRANGE_100 LRANGE_300 LRANGE_600 MSET
redis_ops="PING SET GET INCR LPUSH RPUSH LPOP RPOP SADD SPOP LPUSH LRANGE MSET"

types=(nC-nS nC-yS yC-yS)	#(nC_nS nC_yS yC_yS)
stats=(bw mpstat pps)

#set -x
# Result Folders

curdir=${HOME}/vmabenchmark
[ ! -d "$curdir" ] && echo "ERROR: Directory $curdir does not exists" && exit;
[ ! -f "${curdir}/process.sh" ] && echo "ERROR: Process script ${curdir}/process.sh does not exists" && exit;

serverdir=${curdir}/${1}-S
clientdir=${curdir}/${1}-C

filesavailfor=$(ls ${clientdir}/*.txt | awk -F/ '{print $NF}' | awk -F- '{print $3}'|sort -u|tr "\n" " ")
echo Currently following operations have results for processing:
echo $filesavailfor
#exit;

preprocess_mpstat()	# $1: Input-mpstat-result-file; $2: Output-mpstat-file
{
	local resfile=$1
	egrep -v "Linux|%|Average" $resfile | awk '{print $1,$2,$4,$6,$13}' | tr " " "," > $2
}

generate_graph_data()
{
	run=$(ls ${types[0]}.GET.*.csv | awk -F. '{print $3}')
	fields=("BW-TX-BYTES" "BW-RX-BYTES" "%USR" "%SYS" "%IDLE" "PCKTS-TX" "PCKTS-RX")
	#ops=$(ls *${run}.csv|awk -F. '{print $2}'|sort -u)
	ops=$(ls *${run}.csv|awk -F. '{print $2}'|sort -u)

	echo Removing prevous graph files...
	rm *.graph.csv
	echo DONE.

	# QPS DATA
	for t in ${types[@]}
	do
		grep "requests per second" ${t}_test_result.txt | grep -v IST > ${t}.qps.csv
	done
	
	# Combining columns
	for op in $ops
	do
		for stat in bw pps mpstat
		do

			for cols in `seq 1 7`
			do
				colres=${op}.${cols}.graph.csv
				#echo "${fields[$((cols-1))]},${fields[$((cols-1))]},${fields[$((cols-1))]}" > {colres}
				echo "paste -d, <(cut -f${cols} -d, ${types[0]}.${op}.${run}.csv)  <(cut -f${cols} -d, ${types[1]}.${op}.${run}.csv)  <(cut -f${cols} -d, ${types[2]}.${op}.${run}.csv)" | bash > $colres
			done

		done
	done

	for op in $ops
	do
		graphdata=$op.graph.csv
		echo $(for i in ${fields[@]};do echo -n ${i},${i},${i},,;done) > $graphdata
		paste -d , $(for i in $(seq 1 7); do printf "$op.$i.graph.csv empty.csv ";done) >> $graphdata
	done

	echo Moving all operations graph data to single file...
	allgraphdata=all-ops.graph.csv
	for op in $ops
	do
		echo $(for i in $(seq 1 7);do echo -n ${op},,,,;done) >> $allgraphdata
		cat ${op}.graph.csv >> $allgraphdata
		echo ,,,, >> $allgraphdata
	done
}

post_collection()
{

	#set -x
	rm -rf *.result.csv *.final.csv
	for t in $redis_ops
	do
		#echo Bandwidth: $t
		# BW Cols: 3,4,5,6
		for fl in $(ls *.$t.matched 2>/dev/null | grep bw)
		do
			#grep TX $fl | awk '{print $3" "$4" "$5" "$6}' >> $fl.result 
			grep TX $fl | awk '{print $4","$6}' >> $fl.result.csv 
		done

		#echo PPS: $t
		# PPS Cols: 3,4,5,6
		for fl in $(ls *.$t.matched 2>/dev/null | grep pps)
		do
			#grep TX $fl | awk '{print $3" "$4" "$5" "$6}'>> $fl.result 
			grep TX $fl | awk '{print $4","$6}'>> $fl.result.csv 
		done

		#echo MPSTAT: $t
		# MPSTAT Cols: 4,6 (CPU %: usr,sys)
		for i in $(ls *.$t.matched 2>/dev/null | grep mpstat ) ; do awk '{print $4","$6","$NF}' $i | grep -v "usr" >> $i.result.csv ; done

	done

	for i in ${types[@]}
	do
		echo $i :
		for ops in $redis_ops
		do
			echo -e "\t${ops}"
			#set -x
			files=$(ls *-${i}*.$ops.matched.result.csv 2>/dev/null)

			echo -e "\tFiles: $files"
			[ ! -z "$files" ] &&  paste $files -d, > $i.$ops.final.csv
			#exit;

		done
	done
}

info()
{
	echo -e "\tPATTERN: $1 \n\tIN-FILE: $2 \n\tFOR-OP: $3 \n\tOUT-FILE: $4 \n"
}

search()	# $1:pattern; $2:in-file-prefix; $3: out-file-prefix; $4: matched-for-op; $5: Special-handling-req 
{
	searchpat=$1
	infile_prefix=$2
	outfile_prefix=$3
	_for=$4
	special=$5

	[ $special -eq 1 ] && specialpat=$(echo $searchpat | tr -d / | tr -d " " | tr -d "," | awk -F ':' '{if($1<12){t="AM"}else{t="PM"}; printf "/%02d:%s:[0-9]{2},%s/,//",sqrt((12-$1)^2),$2,t}' )


	for i in ${stats[@]}
	do
		search_file=${infile_prefix}_${i}.txt
		outfile=$outfile_prefix.$i.csv
		
		if [ $i != "mpstat" ]
		then
			info $searchpat $search_file $_for $outfile
			echo "$searchpat,${_for},{$(awk "${searchpat}" ${serverdir}/$search_file | grep -v "IST" | grep -v ",,,," |tr "\n" ";")}" >> $outfile
		else
			pattern="/$( echo $searchpat | tr "," "\n"|tr -d '/' | awk -F ':' '{if($1<12){t="AM"}else{t="PM"}; printf "%02d:%s:[0-9]{2},%s/,/",sqrt((12-$1)^2),$2,t}' )"
			new_pattern=${pattern%",/"}
			[ $special -eq 1 ] &&  echo -e "\t[SPECIAL-FLAG Enabled]" && new_pattern=$specialpat
			info $new_pattern $search_file $_for $outfile
			echo "$searchpat,${_for},{$(awk "${new_pattern}" ${serverdir}/$search_file | grep -v "IST" | grep -v ",,,," |tr "\n" ";")}" >> $outfile

		fi
	done
}

collect()
{
	for ops in ${filesavailfor} #$(for t in ${types[@]};do echo ${t}_test_result.txt;done)
	do
		for environment in ${types[@]}	# nC-nS or nC-yS or yC-yS
		do
			for var in payload connections
			do
				rfile=${environment}-${ops}-${var}.txt
				matchedout=${rfile//.txt/.matched}

				echo Collecting Data for: ${rfile%".txt"}

				if [ -f $rfile ]
				then
					NL=$(cat $rfile | wc -l)
					echo No.of Lines: $NL

					# Process each 'IST' line and get stats for operation
					n=1
					sl=$((NL-1)) # Second line from bottom
					while [ $n -lt $NL ]
					do
						echo -e "Searchig Line-$n / $sl"
							
						if [ $n -ne $sl ]
						then
							got=$(sed -n "$n,$((n+2))p" $rfile)
							_op=$(echo -e "$got" | grep $ops)
							pattern=$(echo -e "$got" | grep IST | awk '{print $4}'| awk -F: '{print "/"$1":"$2":/"}'|tr "\n" ","|sed 's/.$//')
						else
							pattern=$( grep IST $rfile | tail -n1 | awk '{print $4}'| awk -F: '{print "/"$1":"$2":/,//"}')
							#echo  SPECIAL-HANDLING FOR LAST LINE: $pattern
						fi

						#set -x
						if [ "$environment" != "nC-nS" ]
						then
							in_file_prefix=nC-yS-yC-yS
							if [ $n -ne $sl ]
							then
								search $pattern $in_file_prefix $matchedout $_op 0
							else
								search $pattern $in_file_prefix $matchedout $_op 1
							fi
							
						elif [ "$environment" = "nC-nS" ]
						then
							in_file_prefix=nC-nS
							if [ $n -ne $sl ]
							then
								search $pattern $in_file_prefix $matchedout $_op 0
							else
								search $pattern $in_file_prefix $matchedout $_op 1
							fi
						fi
						
						# Increment the line number
						n=$((n+2))
					done
				else
					echo -e "\t[ NO-FILE Error: '$rfile' not available]"
				fi

			done
		done
	done
}


############################ MAIN ###################
echo Removing previous CSV files
rm *.csv

# Generate commands to collect data
collect
exit;

# Do some formatting to keep all data in one place
post_collection

# Generate data from collected info to producing Graphs
generate_graph_data
