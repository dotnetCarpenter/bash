#!/bin/bash
# git_log.sh
# @version 12.10.5
version="12.10.5"
gitpath="$1"; filename="$2"; verbose=false

if [[ $1 == "-h" || $1 == "--help" ]]; then
	echo "Usage: $0 [-v|--version] | [--verbose] [gitpath] [filename]"
	echo "Where gitpath is a path to the git repository you want to get commits from. The path need \"(double quotes) if there is spaces in the path."
	echo "filename is the name of the file you want to save the commits in. Example: ~/git_logs/myProject_log.tsv"
	echo
	echo "WARNING: Path can not have spaces in it as they can not be reliable escaped."
	echo
	echo "git log --since=\"Jun 1 2012\" --author=dotnet[Cc]arpenter --date=iso --reverse --pretty=\"%ad	%s\""
	echo "$0 is interactive if gitpath and filename is not provided."
	exit 0
fi

if [ $1=="--verbose" ]; then
	verbose=true
	gitpath="$2"; filename="$3"
fi

if [[ $1 == "-v" || $1 == "--version" ]]; then
	echo `basename $0` $version
	echo "	(year.month.revision)"
	exit 0
fi

if [ -z "$gitpath" ]
then
	echo "Press enter if the defaults suits you."
	read -p "Enter path to git repository (../Projects/Titanium Studio Workspace/xiing/): " $gitpath
fi
gitpath=${gitpath:-""~/Projects/Titanium\\ Studio\\ Workspace/xiing/""}	# set gitpath to default if empty

min=${gitpath/#\~/$HOME}
echo $min
"$min" | tr ' ' '\ ' | cd;ls;exit

if [ -z "$filename" ]
then
	read -p "Enter file name/path to save your log in (git_log.tsv): " $filename
fi
filename=${filename:-"git_log.tsv"}										# set filename to default if empty

. changedir.sh															# import changedir.sh
$verbose && echo "Trying to change directory to $gitpath"
changeDir ""$gitpath""
$verbose && echo "Changed directory to $PWD"

#echo $gitpath															# debugging line - ignore
#echo $filename															# debugging line - ignore

git log --since="Jun 1 2012" --author=dotnet[Cc]arpenter --date=iso --reverse --pretty="%ad	%s" > $filename

exit