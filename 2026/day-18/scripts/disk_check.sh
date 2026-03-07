#!/bin/bash

#function definition 



check_disk() {

	echo "Disk Usage of /:"
	df -h | awk 'NR==2 {print $1,$3}'
}

check_memory() {
	echo "Free Memory Available :"
	free -h | awk 'NR==2{print $7}'


}

#function call


check_disk
check_memory
