Task 1: What is Docker?
Research and write short notes on:

Q.What is a container and why do we need them?
A.Container is a standard unit of software that packages application code and its dependencies so that the application can run smoothly from one environment to another.

Q.Containers vs Virtual Machines — what's the real difference?
A. 
Containers
Containers doesnot need an allocated/dedicated set of resources from the host OS.
Containers are lightweight and only uses neccessary lib and binaries for the application to run. 
Containers are portable and run in any environment.
Containers are less secure as its share the same OS kernel.
Containers are quick to boot.

VM
VM needs an dedicated set of system resources from the host OS.
VM runs multiple OS to run multiple applications and thus the utlisation of resources are very high.
VM are not portable since the size is huge 
VM are more secure as its offers stronger isolation at hardware level.
VM are very slow to boot.


Q.What is the Docker architecture? (daemon, client, images, containers, registry)
Docker uses a client server architecture.Docker client talks to Docker daemon which helps in running .building and distributing docker containers.The docker client and daemon can remain on the same system or they can be on different system .They talk to each other using REST API .
Docker Daemon : The docker deamon listens to Docker API requests and manages docker objects such as Images, containers, volumes and network.A daemon can talk to other daemon  to manage docker services.
Docker Client : Its the primary way in which docker users talk to docker.When we issue commands such docker run , it sends the command to dockerd which carries them out.
Docker Registry : Its a collection of images .There are both private and public repositories .Docker hub is a public registry which docker uses by default to pull images.


Draw or describe the Docker architecture in your own words.


<img width="1138" height="749" alt="image" src="https://github.com/user-attachments/assets/71f9a082-ccf6-4193-bfbd-f3af03f04ec9" />




Task 2: Install Docker


Install Docker on your machine (or use a cloud instance)

<img width="1395" height="981" alt="image" src="https://github.com/user-attachments/assets/45fd53d5-e69b-493e-ae74-fa388c8acfb1" />

<img width="1919" height="1040" alt="image" src="https://github.com/user-attachments/assets/56321849-ac96-4bd8-bc68-746ae8b8dd0c" />




Verify the installation
Run the hello-world container
Read the output carefully — it explains what just happened

<img width="944" height="615" alt="image" src="https://github.com/user-attachments/assets/a0950cab-f47b-4982-a62b-bb03923d2096" />



Task 3: Run Real Containers
Run an Nginx container and access it in your browser

<img width="1358" height="232" alt="image" src="https://github.com/user-attachments/assets/511ff143-ef81-46a0-862d-75d85add5548" />

<img width="1754" height="1079" alt="image" src="https://github.com/user-attachments/assets/fb340054-4851-44a2-be57-466d926087d1" />



Run an Ubuntu container in interactive mode — explore it like a mini Linux machine

<img width="1432" height="957" alt="image" src="https://github.com/user-attachments/assets/c6943020-611f-4dac-b782-251be9cfdb62" />


List all running containers & List all containers (including stopped ones)

<img width="1432" height="957" alt="image" src="https://github.com/user-attachments/assets/b2af9658-4f32-46d6-8ffd-1191318774b1" />


Stop and remove a container
<img width="1390" height="229" alt="image" src="https://github.com/user-attachments/assets/4577797d-faca-46c0-9b8c-5ca8fc89daf7" />


Task 4: Explore
Run a container in detached mode — what's different?

<img width="1467" height="150" alt="image" src="https://github.com/user-attachments/assets/e87834de-cae2-4ce1-ad55-0d6e0a99e99d" />

When a container is run in detached mode , it just runs in the background and your terminal is free

<img width="1656" height="173" alt="image" src="https://github.com/user-attachments/assets/89c2dbc7-71a7-466c-8200-500fa581862a" />



Give a container a custom name

<img width="1560" height="205" alt="image" src="https://github.com/user-attachments/assets/132de0f4-96d3-4d58-8654-9447518971d8" />


Map a port from the container to your host

<img width="1560" height="205" alt="image" src="https://github.com/user-attachments/assets/1582fb37-3c24-4257-84c4-5127c5492e41" />


Check logs of a running container

<img width="1895" height="546" alt="image" src="https://github.com/user-attachments/assets/de04a6e7-be57-4acf-b295-f73de34526a6" />

Run a command inside a running container

<img width="754" height="114" alt="image" src="https://github.com/user-attachments/assets/d5d599a5-3767-44ed-b0c3-1678b9df0b0a" />


<img width="945" height="888" alt="image" src="https://github.com/user-attachments/assets/eb61c3ab-af07-4a10-b77a-fe98b6304b1c" />










