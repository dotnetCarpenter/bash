#!/bin/sh
# @version 12.10.3
gitpath=$1; filename=$2

if [ -z "$gitpath" ]
then
	echo "Press enter if the defaults suits you."
	read -p "Enter path to git repository (~/Projects/Titanium\ Studio\ Workspace/xiing): " $gitpath
fi
gitpath=${gitpath:-"~/Projects/"Titanium\ Studio\ Workspace"/xiing"}	# set gitpath to default if empty

if [ -z "$filename" ]
then
	read -p "Enter file name/path to save your log in (git_log.tsv): " $filename
fi
filename=${filename:-"git_log.tsv"}										# set gitpath to default if empty

. changedir.sh															# import changedir.sh
changeDir $gitpath
echo "Changed directory to $PWD"

#echo $gitpath															# debugging line - ignore
#echo $filename															# debugging line - ignore

git log --since="Jun 1 2012" --author=dotnet[Cc]arpenter --date=iso --reverse --pretty="%ad	%s" > $filename

exit