# Day 15 – Networking Concepts: DNS, IP, Subnets & Ports

## Challenge Tasks

### Task 1: DNS – How Names Become IPs
1. Explain in 3–4 lines: what happens when you type `google.com` in a browser?
A. When you type google.com , first the browser checks within the local DNS cache for the IP address of google.com , if it finds it then it sends a http request to the IP address.
If the local DNS doesnot have the IP address , the browser will query the DNS server  on the internet and the  DNS resolver will looks for the server which has the IP address of google.com and once the IP address is found, it then sends the HTTP request.
Reference : https://medium.com/@preciousvictory/what-happens-when-you-type-https-www-google-com-30b0115ca1e1
Local Browser Cache->DNS resolver->Root Server->TLD Server->Authoritative Server
www.google.com

<img width="704" height="297" alt="image" src="https://github.com/user-attachments/assets/90f0d4d9-4a0b-43fc-8a75-1a836ad6e8f2" />




3. What are these record types? Write one line each:
   - `A`, `AAAA`, `CNAME`, `MX`, `NS`
A. A represents an IPv4 address
   AAAA represents an IPV6 address
   CNAME represents the domain name is ponting to another domain name
   MX specifies the mail server responsible for recieving email on behalf of the domain
   NS (Name Server) specifies which DNS server is the authoritative source for all DNS records of a given domain

4. Run: `dig google.com` — identify the A record and TTL from the output

<img width="505" height="376" alt="image" src="https://github.com/user-attachments/assets/35eb8404-cbd5-4bac-8a52-152c244305da" />

From the output the TTL(Time to Live) is 148 s and the A represents the IPV4 address i.e 142.250.69.174



---

### Task 2: IP Addressing
1. What is an IPv4 address? How is it structured? (e.g., `192.168.1.10`)
A. It is a 32 bit address which consists of 4 fields sperated by dit(.).IPV4 consists of two things the network address and the host address .
2. Difference between **public** and **private** IPs — give one example of each
A. Public IP are the address which can be accessible from the internet , where as private IP is secure and cannot be accessed from internet.DB is always mapped to a Private IP since it stores all the important information.

Private IP                                                                  Public IP


1.Used within  a private network                                            1.Used for communication over the internet 


2.Unique within a network                                                   2.Globally Unique


3.It needs a NAT to access internet                                         3. Doesnot need a NAT


4.Cannot be accessed from internet                                           4. Visible on Internet



4. What are the private IP ranges?
   - `10.x.x.x`, `172.16.x.x – 172.31.x.x`, `192.168.x.x`
   - 10.0.0.0 - 10.255.255.255
   - 172.16.0.0 - 172.31.255.255
   - 192.168.0.0 - 192.168.255.255
5. Run: `ip addr show` — identify which of your IPs are private

   <img width="683" height="244" alt="image" src="https://github.com/user-attachments/assets/36029c3c-b500-4cad-b401-ef0ffa49f14e" />

   

---

### Task 3: CIDR & Subnetting
1. What does `/24` mean in `192.168.1.0/24`?
A. 24 indicates the subnet mask in CIDR which is eqvivalent to 255.155.255.0 that 24 bits (3 octets) is allocated to network address and 8 bits (last octet) are allocated for host address and can range from 0 to 255 and the no of hosts available are 254.
2. How many usable hosts in a `/24`? A `/16`? A `/28`?
   /24 - 254
   /16 - 65,536 
   /28 - 14
   
3. Explain in your own words: why do we subnet?
A. To divide a large network into small manageable networks.
   To isolate sensitive data from outside world.
5. Quick exercise — fill in:
.
| CIDR | Subnet Mask     | Total IPs | Usable Hosts |
|------|-----------------|-----------|--------------|
| /24  | 255.255.255.0   | 256       | 254          |
| /16  | 255.255.0.0     | 65,536    | 65,534       |
| /28  | 255.255.255.240 | 16        | 14           |

To find the no of usable hosts subtract the subnet mask with 32 and the total no of hosts will be 2 to the power the result of the difference.
eg for the CIDR /24 , 32-24=8 , total no of hosts = 2 power 8 i.e 256 and the usable hosts will be 256-2(excluding the base Ip and the broadcast IP) , the subnet mask will be 255.255.255.0

---

### Task 4: Ports – The Doors to Services
1. What is a port? Why do we need them?
A. Ports are endpoints where a service can be mapped ,it identifies a specific process or service on network.

We need ports to 
TO run  multiple services on a single device simultaneously without interferring with each other .
We have standard ports mapped for services like port 80 for http.
For security , we can block specific ports like DB ports from the outside world while leaving other ports open.

2. Document these common ports:

| Port | Service |
|------|---------|
| 22   | SSH     |
| 80   | HTTP    |
| 443  | HTTPS   |
| 53   | DNS     |
| 3306 | MYSQL   |
| 6379 | REDIS   |
| 27017| MongoDB |

3. Run `ss -tulpn` — match at least 2 listening ports to their services

---

### Task 5: Putting It Together
Answer in 2–3 lines each:
- You run `curl http://myapp.com:8080` — what networking concepts from today are involved?
- DNS Resolution
- Firewall/inbound rules are checked for port 8080
- Connection is established over TCP (Transport Layer)
- It makes a HTTP request & data transfer (Application Layer)
  

  
- Your app can't reach a database at `10.0.1.50:3306` — what would you check first?
- ping the server
- check firewall rules :wether port 3306 is open and listening
- check the database service 

