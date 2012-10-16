#!/bin/sh
# changedir.sh
# @version 12.10.2
changeDir() {
	cd $1 || {
		echo "Cannot change to necessary directory." >&2	#TODO: what does >&2 mean?
		exit $?		# exit with status code from last command (cd)
	}
	# TODO: perhaps it's a good idea to check if the change actually happen and comunicate that back to the calling script..
	#if [ $PWD != $1 ]
	#then
	#	exit 666	# something went horrible wrong
	#fi
	#echo `pwd`	# debugging line - ignore
}