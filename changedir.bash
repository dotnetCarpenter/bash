changeDir() {
	cd $1 || {
		echo "Cannot change to necessary directory." >&2
		exit $?
	}
	#echo `pwd`	# debugging line - ignore
}