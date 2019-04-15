#!/bin/bash

# We use chroot to create virtual environment
virt=virtualized/
mkdir -p $virt
cd $virt

# Create directories to hold binaries and libraries for the virtualized environment
lib_64=lib64/x86_64-linux-gnu/ 
lib_32=lib/x86_64-linux-gnu/

echo Creating required directories for Virtualized Environment...
mkdir -p bin $lib_32 $lib_64

binaries=(ls bash)

echo Copying binaries...
cp $(which ls) ./bin/
cp $(which bash) ./bin/

echo Copying libraries...
for i in ${!binaries[@]}
do
	echo -e "\tCopying libraries of: ${binaries[$i]}"
	#set -x
	#ldd $( which ${binaries[$i]} ) | tr " " "\n" | grep "/lib/" | tr -d "[[:blank:]]" | xargs -I {} cp {} ${lib_32}
	#ldd $( which ${binaries[$i]} ) | tr " " "\n" | grep "/lib64/" | tr -d "[[:blank:]]" | xargs -I {} cp {} ${lib_64}

	 ldd $(which ls) | tr " " "\n" | grep "/lib/" | xargs ls -l | awk '{print $NF}'

	# Creating soft links
	echo -e "\tCreating soft links..."
	
	# x86
	pack=${virt}${lib_32}
	ldd $(which ${binaries[$i]}) |tr " " "\n"|grep "/lib/"|xargs -I{} ls -l {}|grep "\->" | awk '{print $NF,$(NF-2)}' | awk -v dir=$pack -v virt=$virt '{
	if ($1 ~ /^lib[a-zA-Z0-9]/)
		{
			print dir""$1,virt""$2}
	else
		{
			print $1,$2
		}
	}' | xargs -I{} ln -s {}

	# x64
	pack=${virt}${lib_64}
	ldd $(which ${binaries[$i]}) |tr " " "\n"|grep "/lib64/"|xargs -I{} ls -l {}|grep "\->" | awk '{print $NF,$(NF-2)}' | awk -v dir=$pack -v virt=$virt '{
	if ($1 ~ /^lib[a-zA-Z0-9]/)
		{
			print dir""$1,virt""$2}
	else
		{
			print $1,$2
		}
	}'| xargs -I{} ln -s {}

done

echo Now you are ready to enter Virualized Environment using:
echo sudo chroot $virt /bin/bash
