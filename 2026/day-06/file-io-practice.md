#####################To CREATE AN EMPTY FILE###############################
ubuntu@ip-172-31-23-122:~/linux-files-practice$ touch notes.txt
#####################TO WRITE A LINE TO FILE###############################
ubuntu@ip-172-31-23-122:~/linux-files-practice$ echo "This is the first line" > notes.txt
#####################TO APPEND LINES TO THE EXISTING FILE##################
ubuntu@ip-172-31-23-122:~/linux-files-practice$ echo "This is the second line" >> notes.txt
ubuntu@ip-172-31-23-122:~/linux-files-practice$ echo "This is the third line" >> notes.txt
#####################TO READ THE CONTENTS OF THE FILE#######################
ubuntu@ip-172-31-23-122:~/linux-files-practice$ cat notes.txt
This is the first line
This is the second line
This is the third line
#####################READING PARTS OF FILE USING HEAD & TAIL################
ubuntu@ip-172-31-23-122:~/linux-files-practice$ head notes.txt
This is the first line
This is the second line
This is the third line
ubuntu@ip-172-31-23-122:~/linux-files-practice$ tail notes.txt
This is the first line
This is the second line
This is the third line
ubuntu@ip-172-31-23-122:~/linux-files-practice$ tail -1 notes.txt
This is the third line
ubuntu@ip-172-31-23-122:~/linux-files-practice$ tail -2 notes.txt
This is the second line
This is the third line
ubuntu@ip-172-31-23-122:~/linux-files-practice$ head -n 2 notes.txt
This is the first line
This is the second line

##################USING TEE COMMAND################################
ubuntu@ip-172-31-23-122:~/linux-files-practice$ tee -a notes.txt
This line is printed on the prompt and appended on the file
This line is printed on the prompt and appended on the file
^C
ubuntu@ip-172-31-23-122:~/linux-files-practice$ cat notes.txt
This is the first line
This is the second line
This is the third line

ubuntu@ip-172-31-23-122:~/linux-files-practice$ echo "executing tee command" | tee -a notes.txt
executing tee command
ubuntu@ip-172-31-23-122:~/linux-files-practice$ cat notes.txt
This is the first line
This is the second line
This is the third line



This line is printed on the prompt and appended on the file

executing tee command
######################################################################
ubuntu@ip-172-31-23-122:~/linux-files-practice$ ls -l
total 4
-rw-rw-r-- 1 ubuntu ubuntu 156 Feb 17 13:36 notes.txt
ubuntu@ip-172-31-23-122:~/linux-files-practice$

CONCLUSION:
EVERYTHING IN LINUX IS A FILE OR DIRECTORY. SO IT'S VERY IMPORTANT TO LEARN HOW TO HANDLE FILES.



