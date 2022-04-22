#!/bin/bash
if [[ $1 =~ \-h|\-\-help || $1 = "" ]];then
	printf "Usage: $0 <FromServer> </source/path/to/filename> <ToServer> </dest/directory>\n"
	printf "\n"
	exit
fi
ServerFROM=$1
ServerPathFROM=$2
ServerTO=$3
ServerPathTO=$4

ansible-playbook -b --private-key /home/ansible/ansible_key RemoteCopy.yml -e "Path_Copy_FROM=${ServerPathFROM} Path_Copy_TO=${ServerPathTO} HostTO=${ServerTO} HostFROM=${ServerFROM}" 1>/dev/null 
