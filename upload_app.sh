#!/bin/bash
display_usage() { 	
	echo -e "\nUsage: $0 app_dir app_name\n" 
	} 

	if [  $# -le 1 ] 
	then 
		display_usage
		exit 1
	fi 
 
	if [[ ( $# == "--help") ||  $# == "-h" ]] 
	then 
		display_usage
		exit 0
	fi 

rsync -r $1/ shiny@10.150.4.18:/home/shiny/apps/$2