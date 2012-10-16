#!/bin/sh
# replaceFileNames.sh
# @version 12.10.4
version="12.10.4"
path=$1; find=$2; change=$3; verbose=false

#echo "Number of command-line arguments passed to script = ${#@}"	# debugging
#echo "Number of command-line arguments passed to script = ${#*}"	# debugging

# display usage if -h or --help
if [[ "$path" == "-h" || "$path" == "--help" ]]; then
	echo "Usage: $0 [-v|--version] | [--verbose] path [find] [change]"
	echo "Where path is where you want to change file names. Example: ./"
	echo "find is a regular expression that finds the part you want to replace (using egrep -e). Defaults to \"\.tmp\"."
	echo "change is what you want to subtitute the find part with. Deletes the find part if empty."
	echo "If no arguments are provided the script does nothing."
	echo
	echo "Example: $0 ~/Downloads/"
	echo "The above example will remove \".tmp\" from all files with \".tmp\" in the file name in the \"Downloads\" directory."
	echo
	echo "Example: $0 ../ .html .htm"
	echo "The above example will change all occurrences of .html to .htm in the parent directory."
#	echo "Example: $0 ~/Downloads/ \..{2,4}$ \.bak" # Doesn't work on OSX (GNU grep 2.5.1)
#	echo "The above example will change all file extensions in the Download diretory to .bak"
	echo "Regular Expression support is rather sketchy on OSX."
	exit 0
fi

if [[ "$gitpath" == "-v" || "$gitpath" == "--version" ]]; then
	echo $version
	echo "(year.month.revision)"
	exit 0
fi

# support --verbose command
if [[ "$path" == "--verbose" ]]; then
	verbose=true
	path=$2; find=$3; change=$4
fi

. changedir.sh								# import changedir.sh
changeDir $path								# call changedir with $path
find=${find:-"\.tmp"}						# short for:	if [ ! -n "$find" ];then
											#					find="\.tmp"
											#				fi
$verbose && echo "Finding files with $find"
											#echo $PWD	# debugging line - ignore
htmlFiles=(`ls | egrep -e ${find}`)			# grap all files with ".tmp" in file name in current directory
for file in "${htmlFiles[@]}"				# loop through all files
do
	$verbose && echo "Changing $file"
	`mv $file ${file//${find}/${change}}`	# execute mv command with file name and file name with-out ".tmp"
	$verbose && echo "To ${file//${find}/${change}}"
done
exit $?										# exit with status code from last command (mv)