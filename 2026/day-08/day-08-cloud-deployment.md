COMMANDS USED :
sudo apt-get update
sudo apt install nginx
systemctl status nginx
cd /var/log/nginx/
ls -ltr
cat *.log > /home/ubuntu/nginx-logs.txt
cd
pwd
ls -l
cat nginx-logs.txt
cat /var/log/nginx/access.log

On Local 
scp -i practice-server-key.pem ubuntu@ec2-34-219-49-221.us-west-2.compute.amazonaws.com:~/nginx-logs.txt .

To connect from Local using SSH 
ssh -i practice-server-key.pem ubuntu@ec2-34-219-49-221.us-west-2.compute.amazonaws.com

CHALLENGES FACED:
It was pretty staright forward and i didnot face any major challenges.

What I Learned:

I learned how to launch an EC2 instance and how to connect to server using the SSH protocol 
I learned how to install nginx and edit the security group so that port 80 is enabled to access the index.html page on the browser 
I learned about the SCP command to download the log files onto the local machine from the server.
