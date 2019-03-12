#!/usr/bin/env bash

# Options to be passed.
: '
1. rwmixreads
2. blocksizes
3. skip_preconditioning
4. skip_purge
5. iodepth
6. numjobs
7. writepattern
8. Activerange
9. maxrounds
10. disk path
'

show_help()
{
	rwmixwrite=""	#w
	blocksizes=""	#b
	skip_preconditioning=""	#c
	skip_purge=""	#p
	iodepth=""	#i
	numjobs=""	#n
	writepattern=""	#t
	Activerange=""	#r
	maxrounds=""	#m
	diskpath=""	#d
}

# Arguments to be set
rwmixwrite=""	#w
blocksizes=""	#b
skip_preconditioning=""	#c
skip_purge=""	#p
iodepth=""	#i
numjobs=""	#n
writepattern=""	#t
Activerange=""	#r
maxrounds=""	#m
diskpath=""	#d

# read the options
#TEMP=`getopt -o a:bc: --long arga::,argb,argc: -n 'test.sh' -- "$@"`
TEMP=`getopt -o w:b:c::p::i:n:t:r:m:d: --long no-preconditioning::,skip-purge::,rwmixwrite:,block-size:,iodepth:,numjobs:,write-pattern:,active-range:,max-rounds:,disk-path: -- "$@"`
eval set -- "$TEMP"

# extract options and their arguments into variables.
while true ; do
	case "$1" in
		#1
		-w|--rwmixwrite)
			case "$2" in
				"") shift 2;; 
				*) rwmixwrite=$2; shift 2;;	#w
			esac ;;
		#2
		-b|--block-size)
			case "$2" in
				"") shift 2 ;;
				*) blocksizes=$2; shift 2;;	#b
			esac ;;
		#3
		-c|--no-preconditioning)
			case "$2" in
				#"") skip_preconditioning='YES'; shift 2;; 
				"") shift 2 ;;
				*) skip_preconditioning=$2; shift 2;;	#c
			esac ;;
		#4
		-p|--skip-purge)
			case "$2" in
				#"") shift 2;; 
				#"") skip_purge='YES'; shift 2;;	#p
				"") shift 2 ;;
				*) skip_purge=$2; shift 2;;	#p
			esac ;;
		#5
		-i|--iodepth)
			case "$2" in
				"") shift 2;; 
				*) iodepth=$2 ; shift 2;;	#i
			esac ;;
		#6
		-n|--numjobs)
			case "$2" in
				"") shift 2;; 
				*) numjobs=$2; shift 2;; 	#n
			esac ;;
		#7
		-t|--write-pattern)
			case "$2" in
				"") shift 2;; 
				*) writepattern=$2 ; shift 2;;	#t
			esac ;;
		#8
		-r|--active-range)
			case "$2" in
				"") shift 2;; 
				*) activerange=$2;shift 2;;	#r
			esac ;;
		#9
		-m|--max-rounds)
			case "$2" in
				"") shift 2;; 
				*) maxrounds=$2 ; shift 2;;	#m
			esac ;;
		#10
		-d|--disk-path)
			case "$2" in
				"") shift 2;; 
				*) diskpath=$2 ; shift 2;;	#d
			esac ;;
		--) shift ; break ;;
		*) echo "Internal error!" ; exit 1 ;;
	esac
done

# do something with the variables -- in this case the lamest possible one :-)

echo rwmixwrite=$rwmixwrite	
echo blocksizes=$blocksizes
echo skip_preconditioning=$skip_preconditioning
echo skip_purge=$skip_purge
echo iodepth=$iodepth
echo numjobs=$numjobs
echo writepattern=$writepattern
echo activerange=$activerange
echo maxrounds=$maxrounds
echo diskpath=$diskpath
