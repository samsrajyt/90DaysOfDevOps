#!/bin/bash

set -euo pipefail

host_os_info() {
	echo "Hostname:";hostname -i
	echo "OS Info:";hostnamectl|grep "Operating System"
}

uptime_info() {
	echo "Uptime:";uptime
}


top_disk_usage() {
	echo "Top 5 Disk Usage";df -h| awk 'sort -n $2{print$1,$2}' |head -6
}

memory_usage() {
	echo "Memory Used";free -mh|awk 'NR==2{print $3}'
	echo "Memory Available";free -mh|awk 'NR==2{print $7}'



}	

top_5_cpu_consuming_processess() {
	echo "Top 5 CPU-consuming processes:";ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

}



echo "###############################################################"
host_os_info
echo "###############################################################"
uptime_info
echo "###############################################################"
top_disk_usage
echo "###############################################################"
memory_usage
echo "###############################################################"
top_5_cpu_consuming_processess
