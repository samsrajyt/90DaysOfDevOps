**hostname -I** -> gives the private ip address of the server 

<img width="411" height="93" alt="image" src="https://github.com/user-attachments/assets/c1f28518-c70e-4661-b330-c15a1f297854" />

 ping www.amazon.in -> It uses the ICMP protocol 
<img width="1098" height="313" alt="image" src="https://github.com/user-attachments/assets/6029ceb0-de43-4d22-88a7-79f655330359" />

traceroute www.google.com

<img width="1916" height="182" alt="image" src="https://github.com/user-attachments/assets/7e5d8c9f-dafb-497c-ab0a-339528b6e0de" />

If we see * * * in the output it means that the router is overloaded and doesnot respond .

<img width="1059" height="216" alt="image" src="https://github.com/user-attachments/assets/68528333-1e29-435d-9b8b-e92f8d110d15" />

tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1/init

The above output means that the port 22 is in listening mode for all SSH connections and is managed by systemd 

<img width="813" height="615" alt="image" src="https://github.com/user-attachments/assets/93e908ed-2ccb-41c2-b788-74d76a73c193" />

**The resolved IP** is 142.251.34.196

<img width="1905" height="370" alt="image" src="https://github.com/user-attachments/assets/21439075-273d-4276-8be6-389346f68902" />

**HTTP status code**: HTTP/1.1 200 OK

<img width="922" height="217" alt="image" src="https://github.com/user-attachments/assets/7b943a40-29dd-4e27-8145-db026040bd3b" />
There are 2 ESTABLISHED Connections and 4 LISTENING Ports 
LISTENING status means that the port is available for incoming connections 
When a connection is ACTIVE this means that the connection is established , the local and the remote systems can send and recieve data .


ubuntu@ip-172-31-30-155:~$ nc -zv localhost 22
Connection to localhost (127.0.0.1) 22 port [tcp/ssh] succeeded!


Which command gives you the fastest signal when something is broken?

**ping **

What layer (OSI/TCP-IP) would you inspect next if DNS fails? If HTTP 500 shows up?

**Transport Layer and Application Layer **

Two follow-up checks you’d run in a real incident.

**systemctl status 
traceroute **









