#!/bin/sh
# replaceFileNames.sh
# @version 12.10.2
path=$1; find=$2; change=$3

# display usage if -h or --help
if [[ "$path" == "-h" || "$path" == "--help" ]]; then
	echo "Usage: $0 path [find] [change]"
	echo "Where path is where you want to change file names. Example: ./"
	echo "find is a regular expression that finds the part you want to replace (using grep -e). Defaults to \"\.tmp\"."
	echo "change is what you want to subtitute the find part with. Deletes the find part if empty."
	echo "If no arguments are provided the script does nothing."
	echo
	echo "Example: $0 ~/Downloads/"
	echo "The above example will remove \".tmp\" from all files with \".tmp\" in the file name in the \"Downloads\" directory."
	echo
#	echo "Example: $0 ~/Downloads/ \..{2,4}$ \.bak" # Doesn't work on OSX (GNU grep 2.5.1)
#	echo "The above example will change all file extensions in the Download diretory to .bak"
	echo "Regular Expression support is rather sketchy on OSX."
	exit 0
fi

. changedir.sh								# import changedir.sh
changeDir $path								# call changedir with $path
find=${find:-"\.tmp"}						# short for:	if [ ! -n "$find" ];then
											#					find="\.tmp"
											#				fi
											#echo "Finding files with $find"	# debugging line - ignore
											#echo `pwd`	# debugging line - ignore
htmlFiles=(`ls | egrep -e ${find}`)			# grap all files with ".tmp" in file name in current directory
for file in "${htmlFiles[@]}"				# loop through all files
do
											#echo "Changing $file" # debugging line - ignore
	`mv $file ${file//${find}/${change}}`	# execute mv command with file name and file name with-out ".tmp"
											#echo "To ${file//${find}/${change}}" # debugging line - ignore
done
exit $?										# exit with status code from last command (mv)