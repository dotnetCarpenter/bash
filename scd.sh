#!/bin/bash
echo `basename $0`
#read path
path=$1

doCd() {
	path=${@/#\~/$HOME}""; echo $path
	cd $path
}
#path=${path:-""$HOME/Projects/"Titanium\ Studio\ Workspace"/xiing""}
path=""../Titanium\ Studio\ Workspace/xiing""
echo $path
#path=${path/#\~/$HOME}
doCd $path
ls
exit