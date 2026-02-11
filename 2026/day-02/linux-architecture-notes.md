Linux Architecture:

Linux works on ASK principle.
A - Application
S - Shell 
k - Kernel

Application :
They are tools or software that is installed to perform various tasks and they dont have the direct access to the hardware and hence it has to use the shell which acts as the interface and talks to the kernel and the kernel whiich is the heart of the operating system which in turn talks to the hardware devices and get the work done requested by the application.

init/Systemd:
When we intialize the server , the BIOS first loads up the hardware and then kicks in the GNU GRUB ( Grand Universal Bootloader) and in the background we see that the systemd which is called init process runs which has the process id 1 .

Everything in linux is a process.A process is simply a program which runs on the server .When ever a command is executed the OS creates a process to run that command , the process has a PID and each process has a unique PID.

We can manage the processess by using the following commands :
1.ps 
2.top
3.htop

There are various states of process:
1.RUNNING
2.TERMINATED
3.ZOMBIE 
4.SUSPENDED 

5 commands that can be used daily are
1.create files 
  touch <filename>
2.make directories 
  mkdir <dirname>
3.copy files
  cp <src> <dest>
4.rename and move files
  mv <src> <dest>
5.to check the disk file 
  df -h 
6.to ping a url 
  ping <url>
  


