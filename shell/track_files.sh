#!/bin/bash

track(){
	watch_dir=$1
	inotifywait -m -r ${watch_dir} -e create,modify,delete | while read path event fl ; do
		echo $event $fl -in- $path
	done
}

track $PWD
