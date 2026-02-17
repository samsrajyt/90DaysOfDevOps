#####################################################################################
A web application service called 'myapp' failed to start after a server reboot.
What commands would you run to diagnose the issue?
Write at least 4 commands in order.

systemctl status myapp
journalctl  -u myapp
OPtional : systemctl list-units --type=service|grep myapp
systemctl is-enabled myapp 
systemctl start myapp
systemctl enable myapp 
######################################################################################
Your manager reports that the application server is slow.
You SSH into the server. What commands would you run to identify
which process is using high CPU?

use htop command to check which process is consuming high CPU 
execute this command ps aux --sort=-%cpu | head -10
After getting the PID , kill the process or stop the process accordingly
######################################################################################
A developer asks: "Where are the logs for the 'docker' service?"
The service is managed by systemd.
What commands would you use?

systemctl status docker 
journalctl -u docker 
journalctl -u docker -n 50 
journalctl -u docker -f (-f stands for follow)

######################################################################################
A script at /home/user/backup.sh is not executing.
When you run it: ./backup.sh
You get: "Permission denied"

What commands would you use to fix this?

#check wether user has execute permision 
ls -ltr backup.sh

#give execute permission based by examining the permissions 
chmod +x /home/user/backup.sh

#check if the permission changed 
ls -l /home/user/backup.sh

#trying running it now
./backup.sh
##################################EOF##################################################
