first obeservation 
docker pull accept only one argument and cannot pass multpile arguments 

Task 1: Docker Images
Pull the nginx, ubuntu, and alpine images from Docker Hub

<img width="927" height="454" alt="image" src="https://github.com/user-attachments/assets/27748007-2e20-4302-ae73-38e34991da33" />


List all images on your machine — note the sizes
--------------------------
REPOSITORY    SIZE
nginx         161MB
ubuntu        78.1MB
alpine        8.44MB
hello-world   10.1kB
--------------------------

<img width="727" height="174" alt="image" src="https://github.com/user-attachments/assets/7cd5a356-b229-4029-b994-8e2ff82bd20d" />


Compare ubuntu vs alpine — why is one much smaller?
Alpine is of a smaller size than ubuntu 
Alpine is a super minimal linux distriution built for speed and security , the lesser the image size the more faster and secure it is.It only has the essentail libraries.
Ubuntu is a complete linux OS which comes with pre installed packages like bash,curl,apt etc

Inspect an image — what information can you see?
<img width="1483" height="1054" alt="image" src="https://github.com/user-attachments/assets/8c7cc7d0-1a42-48b9-8f2d-e0b91c7b5d9d" />

It contains the low level meta deta of the image in JSON format.

Remove an image you no longer need

<img width="996" height="403" alt="image" src="https://github.com/user-attachments/assets/1ff48fa3-7515-48d3-bd24-4f672b6277b5" />


Task 2: Image Layers
Run docker image history nginx — what do you see?
<img width="1255" height="530" alt="image" src="https://github.com/user-attachments/assets/2622a7c5-c96e-4d2c-a8b8-1f342f0842e6" />

Each line is a layer. Note how some layers show sizes and some show 0B

Q.Write in your notes: What are layers and why does Docker use them?

A.An image is a combination of layers , each layer has a specific filesystem modification like adding,removing or modifying files .
Docker images are constructed in a layered file system.
Layers are read-only snapshots of file system.When you construct an image , they are are made using this structure 
Base Layer : Usually an OS distribution 
Dependency Layer : Installed packages 
Application Layer : The Source Code of the application 
Writable Layer : Docker runs a very thin container layer on top that allows run time changes while the underlying image layers remains unchanged.

Why use layers?
Docker uses a union file system that blends all the layers file changes in a single view.
1. Storage Efficiency
If you have five different images all based on ubuntu:22.04, Docker only stores that Ubuntu base layer once on your disk. All five images simply point to the same physical data, saving massive amounts of storage space.

2. Speed and Bandwidth
When you update your application code and "push" a new version of an image, Docker only uploads the layers that changed. If your base OS and language dependencies haven't changed, Docker skips them entirely. This makes deployments significantly faster.

3. Build Caching
Docker remembers the layers it has built before. If you run a build and only change the last line of your Dockerfile, Docker will reuse the cached layers for everything above it.

4. Immutability
Because the image layers are read-only, you can be certain that the environment is identical every time it's launched. Any changes made during execution happen in the temporary top layer and disappear when the container is deleted, keeping the core image "clean." 


Task 3: Container Lifecycle
Practice the full lifecycle on one container:

<img width="818" height="442" alt="image" src="https://github.com/user-attachments/assets/39ffff61-d725-4c4a-bc93-be9f8ea26d36" />


Create a container (without starting it)

<img width="1048" height="243" alt="image" src="https://github.com/user-attachments/assets/c1ab5c1c-90e1-4372-a2ca-6a40603714f2" />

Start the container

<img width="1919" height="216" alt="image" src="https://github.com/user-attachments/assets/bc09b357-09c4-45c2-a67a-d09e656aad37" />


Pause it and check status

<img width="1735" height="193" alt="image" src="https://github.com/user-attachments/assets/b6f389b5-7f5a-4f05-aec1-46a33d13eae7" />

Unpause it

<img width="1500" height="162" alt="image" src="https://github.com/user-attachments/assets/9dd65424-4d27-403e-a6f3-bb52a1378061" />


Stop it

<img width="1317" height="146" alt="image" src="https://github.com/user-attachments/assets/50181013-9fc6-4593-b90b-25a8526f7a36" />

Restart it

<img width="1919" height="150" alt="image" src="https://github.com/user-attachments/assets/4e4348c5-7abf-4ae6-8918-031ef182ef94" />


Kill it

<img width="1436" height="155" alt="image" src="https://github.com/user-attachments/assets/d69288c6-9c10-499f-8411-cf09214bdcdc" />


Remove it

<img width="1556" height="132" alt="image" src="https://github.com/user-attachments/assets/be932d83-7cd4-4c97-9bb1-25b52548eae1" />

Check docker ps -a after each step — observe the state changes.


Task 4: Working with Running Containers
Run an Nginx container in detached mode

<img width="1512" height="215" alt="image" src="https://github.com/user-attachments/assets/bb1d5cb2-4e4f-424c-b081-7e1930a31276" />

View its logs

<img width="1745" height="509" alt="image" src="https://github.com/user-attachments/assets/432b511e-6873-4d5f-b3d5-6ae62cf88351" />

View real-time logs (follow mode)

<img width="1919" height="574" alt="image" src="https://github.com/user-attachments/assets/683955de-10ee-4bfb-bc4c-feeaec582b47" />

Exec into the container and look around the filesystem

<img width="992" height="728" alt="image" src="https://github.com/user-attachments/assets/1b43b610-2ca9-497b-bfe2-4c676e9bb506" />


Run a single command inside the container without entering it

<img width="748" height="514" alt="image" src="https://github.com/user-attachments/assets/ec21d6ca-0d6a-4ff6-8302-6e3393cdd23e" />


Inspect the container — find its IP address, port mappings, and mounts

<img width="775" height="337" alt="image" src="https://github.com/user-attachments/assets/4cf30ca9-30fd-44f7-8363-1313ce5bcf32" />

<img width="794" height="73" alt="image" src="https://github.com/user-attachments/assets/981d7cb5-0fbd-4957-9b8d-34da91b60412" />

<img width="511" height="345" alt="image" src="https://github.com/user-attachments/assets/51c11da2-b5d1-4400-82b0-7d5d375a162b" />


Task 5: Cleanup
Stop all running containers in one command
A.docker stop $(docker ps -q)
<img width="1429" height="243" alt="image" src="https://github.com/user-attachments/assets/09d56699-0f3f-4efd-829b-65ba69b7fc13" />

Remove all stopped containers in one command
A.docker rm $(docker ps -aq)
<img width="1071" height="179" alt="image" src="https://github.com/user-attachments/assets/884da5d5-aad8-45ab-b439-f57fe7965203" />

Remove unused images

<img width="1084" height="614" alt="image" src="https://github.com/user-attachments/assets/527d94a5-02a3-4e02-94c0-c4da62a1e3f8" />


Check how much disk space Docker is using
<img width="871" height="176" alt="image" src="https://github.com/user-attachments/assets/bb18c764-d342-49ca-8859-9463a0a0ee74" />





