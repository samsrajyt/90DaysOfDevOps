## Task 1: Recall the Kubernetes Story

- **Why was Kubernetes created? What problem does it solve that Docker alone cannot?**
 
   *Docker can build multiple containers on one server but what about running thousand containers across 50 servers.To solve this , kubernetes was created to Auto scale and auto heal application.*

- Who created Kubernetes and what was it inspired by?

  *Kubernetes was created by google by taking inspiration from borg which was google's internal cluster manager.It was published on 6 June 2014 and its written in Go , later donated to the CNCF (Cloud Native Computing Foundation) for its maitainance as open source project.*

- What does the name "Kubernetes" mean?

   *It meaning in greek means helmsman or pilot , because a container ship needs a helmsman to steer its cargo.This is also why the Kubernetes logo is a ship's steering wheel with seven spokes.*



## Task 2: Draw the Kubernetes Architecture

[k8s architecture .pdf](https://github.com/user-attachments/files/26087950/k8s.architecture.pdf)

## What happens when you run kubectl apply -f pod.yaml? Trace the request through each component.
  * ***kubectl sends the YAML to API server,the API server checks and validates YAML and its author.***

  * ***The API server then stores into etcd an pod intent .THe pod is now in pending state.***

  * ***The scheduler is always watching the API server and it sees an empty pod with no node assigned to it , based on the resources available it allocates a specific worker node .***
  
  * ***The scheduler tells the API Server its decision and API Server updates this info in etcd.***

  * ***The kubelet is also watching the API Server and once the kublet of the assigned node sees that , it picks up and asks the container engine ( docker) to pull the engine and start the container.***

  * ***Once the container is up and running , the kubelet updates API server that its up and running.***

  * ***The API server updates this info in etcd.***


## What happens if the API server goes down?                                        
   ***API server goes down , the communication between the master and the server node is broken.You will not able to scale up , auto heal or create new pods.***

## What happens if a worker node goes down?
   ***Application will not be up and running, this node will be marked as unhealthy and the master node/control plane will choose another healthy to run the container.***


## Task 4: Set Up Your Local Cluster

   ## Write down: Which one did you choose and why?
   
   ***I choose Kind , as it is kubernetes in docker and i have docker desktop configured  on my PC and since k8s needs a cluster which will need more system resources.***

## Task 5: Explore Your Cluster

  ## Can you match each running pod in kube-system to a component in your architecture diagram?
     
   ***Yes***

  ## What is a kubeconfig? Where is it stored on your machine?

  ***kubeconfig is a yaml file which tells kubectl three things : Clusters,Users & Context.Its provides Authentication and Authorization for kubectl.***
  **It is placed at ```~/.kube/config ```**

## What each kube-system pod does?
| **Pod Name** | **Role**   | 
|--------------|------------|
|API Server    |Communication Hub |
|Scheduler     |Resource Allocation|
|etcd          |Storage|
|CoreDNS       |Service Discovery|
|kube-Proxy    |Network Routing|


