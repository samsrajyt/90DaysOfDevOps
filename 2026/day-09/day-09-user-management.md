# Day 09 Challenge

## Users & Groups Created
- Users: tokyo, berlin, professor, nairobi
- Groups: developers, admins, project-team

## Group Assignments
[List who is in which groups]
groups tokyo
- tokyo developers project-team
groups berlin
- berlin developers admins
groups professor
- professor admins
groups nairobi
- nairobi project-team

## Directories Created
[List directories with permissions]

nairobi@ip-172-31-26-223:/opt$ ls -ltr
total 8
drwxrwxr-x 2 root developers   4096 Feb 18 09:40 dev-project
drwxrwxr-x 2 root project-team 4096 Feb 18 12:33 project-team

## Commands Used
groups nairobi
groups tokyo
groups berlin
groups professor
groups nairobi

sudo useradd -m tokyo -s /bin/bash
sudo passwd tokyo
cat /etc/passwd
sudo groupadd developers
sudo gpasswd tokyo developers
sudo gpasswd -M berlin,tokyo developers

chgrp project-team /opt/project-team
chmod 775 /opt/project-team

ls -ld 
nairobi@ip-172-31-26-223:/opt$ ls -ld /opt/project-team/
drwxrwxr-x 2 root project-team 4096 Feb 18 12:33 /opt/project-team/


## What I Learned
To create new users
To create new groups and add users to the group 
To change group owner of the directory 
To change permissions of directory
To list the groups a user belongs.
