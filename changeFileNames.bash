#!/bin/bash
# changeFileNames.bash
# @version 12.10.2
. changedir.bash
changeDir $1
echo `pwd`
htmlFiles=(`ls | grep ".tmp"`)	# grap all files with ".tmp" in file name in current directory
for file in "${htmlFiles[@]}"	# loop through all files
do
	`mv $file ${file/\.tmp/}`	# exucute mv command with file name and file name with-out ".tmp"
	#echo ${file/\.tmp/}		# debugging line - ignore
done
exit $?							# exit with status code from last command (mv)