Service management
systemctl start <service name> -> starts the service mentioned
systemctl stop <service name> -> stops the service mentioned 
systemctl status <service name> -> shows the status of the service mentioned
systemctl restart <service name> -> restarts the service mentioned 
systemctl list-unit-files  -> To show all installed unit files
journalctl -> prints the log entries from systemd journal
journalctl -u <unitname>, eg: journalctl docker

Process Management
ps -ef -> to see every process running on the system
ps aux   
top -> displays a dynamic real time view of processes
htop -> displays a dynamic real time view of processes in a interactive manner
atop -> display detailed information on hardware and proceesses
kill <pid>-> to kill any running process by PID
lsof -> list all open files 
lsof -u root -> list all the open files opened by root 
watch <command> -> executes command specified and shows periodic updates

File system
df -h -> to check the filesystem space usage
du -> shows disk usage of file/folders on the current directory
du -sh -> total usage of the current directory
free -h -> displays free and used memory in human readable units
free -m -> displays free and used memory in MB
free -g -> displays free and used memory in GB 



Networking troubleshooting
dig <domain name> -> displays DNS info of a domain
ping -> Sends a ICMP echo request to the host or gateway 
curl -> display the html source of link 
ifconfig -> to list the network interfaces with their ip address
ifconfig -a -> to list the network interfaces with their ip address even when they are not active
ip a -> to display all the interfaces and its ip address
netstat -r --> to list the routing table of the kernel
wget <link> --> to download any file from the link

